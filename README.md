Clean/iTasks Distribution for ArchLinux
=========

This AUR package creates an ArchLinux packages of the Clean/iTasks system.

There are a few caveats to its usage, that need to be explained.

- Normally Clean/iTasks needs to be locally installed (into the user's
  home-directory). This is because at compile-time, the envirnment and library
  files may be changed by the clm/cpm build systems.
- This package installed Clean/iTasks globally, which renders it unusable for
  most tasks.
- As such the package provides two things,
  - a script called `clenv` is provided that essentially creates a copy of the
    distribution in the user's home directory.
  - the clm/cpm binaries are wrapped in a script detects the _local clean environment_
    and correctly sets some environment variables to make the clm/cpm tools use
    this.
