Import("env")
env.Append(
  LINKFLAGS=[
      "-fno-use-linker-plugin",
  ]
)
