# `hackmd-cli`

The `PKGBUILD` builds the HackMD command line tool from the upstream release tarball.

- `prepare()`: installs the dependencies with `pnpm` from the lockfile, and copies `yargs` to `yargs.cjs` in the `mocha` dependency tree, because `yargs` 16.2.0 maps its `./yargs` export to a file that has no extension, and Node refuses to load that file.
- `build()`: compiles the TypeScript sources and writes the `oclif` manifest.
- `check()`: runs the unit tests.
- `package()`: removes the development dependencies, installs the application to `/usr/lib/node_modules/@hackmd/hackmd-cli`, links `/usr/bin/hackmd-cli`, and verifies the version of the installed executable.

Links:
- Upstream: https://github.com/hackmdio/hackmd-cli
- AUR: https://aur.archlinux.org/packages/hackmd-cli
