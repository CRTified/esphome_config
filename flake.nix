{
  description = "Collection of my esphome.io configurations.";

  inputs.pre-commit-hooks.url = "github:cachix/git-hooks.nix";

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
