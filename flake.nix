{
  description = "Collection of my esphome.io configurations.";

  inputs = {
    pre-commit-hooks = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:cachix/git-hooks.nix";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      checks = forAllSystems (system: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            # nix hooks
            statix.enable = true;
            nixpkgs-fmt.enable = true;
            clang-format.enable = true;

            # bash hooks
            shellcheck.enable = true;
            shfmt.enable = true;

            # markdown hooks
            lychee.enable = true;

            # git hooks
            convco.enable = true;

            # yaml hooks
            yamllint = {
              enable = true;
              settings.configuration = builtins.toJSON {
                extends = "default";
                rules = {
                  braces = {
                    level = "error";
                    max-spaces-inside = 1;
                    max-spaces-inside-empty = -1;
                    min-spaces-inside = 0;
                    min-spaces-inside-empty = -1;
                  };
                  brackets = {
                    level = "error";
                    max-spaces-inside = 0;
                    max-spaces-inside-empty = -1;
                    min-spaces-inside = 0;
                    min-spaces-inside-empty = -1;
                  };
                  colons = {
                    level = "error";
                    max-spaces-after = 1;
                    max-spaces-before = 0;
                  };
                  commas = {
                    level = "error";
                    max-spaces-after = 1;
                    max-spaces-before = 0;
                    min-spaces-after = 1;
                  };
                  comments = {
                    level = "error";
                    min-spaces-from-content = 2;
                    require-starting-space = true;
                  };
                  comments-indentation = "disable";
                  document-end = {
                    level = "error";
                    present = false;
                  };
                  document-start = {
                    level = "error";
                    present = false;
                  };
                  empty-lines = {
                    level = "error";
                    max = 2;
                    max-end = 1;
                    max-start = 0;
                  };
                  hyphens = {
                    level = "error";
                    max-spaces-after = 1;
                  };
                  indentation = {
                    check-multi-line-strings = false;
                    indent-sequences = true;
                    level = "error";
                    spaces = 2;
                  };
                  key-duplicates = {
                    level = "error";
                  };
                  line-length = "disable";
                  new-line-at-end-of-file = {
                    level = "error";
                  };
                  new-lines = {
                    level = "error";
                    type = "unix";
                  };
                  trailing-spaces = {
                    level = "error";
                  };
                  truthy = {
                    level = "error";
                  };
                };
              };
            };

            # esphome hooks
            esphome-config = {
              enable = true;
              name = "esphome config";
              entry = "${nixpkgs.legacyPackages.${system}.esphome}/bin/esphome --quiet config";
              files = "^devices/";
              types = [ "yaml" ];
              pass_filenames = true;
              stages = [ "pre-commit" ];
            };

            # exif hook
            exif-cleanup = {
              enable = true;
              name = "exif cleanup";
              entry = "${
                nixpkgs.legacyPackages.${system}.exiftool
              }/bin/exiftool -all:all= -overwrite_original_in_place -quiet";
              types = [ "image" ];
              pass_filenames = true;
              stages = [ "pre-commit" ];
            };
          };
        };
      });

      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
          buildInputs =
            (with nixpkgs.legacyPackages.${system}; [ esphome ])
            ++ self.checks.${system}.pre-commit-check.enabledPackages;
        };
      });
    };
}
