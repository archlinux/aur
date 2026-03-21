# mobvibe-cli-git AUR packaging

This directory contains the AUR metadata for publishing the Mobvibe CLI as `mobvibe-cli-git`.

## Package behavior

- Builds from the latest git checkout of `Eric-Song-Nop/mobvibe`
- Compiles `packages/shared` first because `apps/mobvibe-cli` imports it at build time
- Compiles a native Bun binary for the current Arch target
- Installs the real `mobvibe` executable to `/usr/bin/mobvibe`

## Update workflow

From this repository:

```bash
cd packaging/aur/mobvibe-cli-git
makepkg --printsrcinfo > .SRCINFO
```

Then push `PKGBUILD` and `.SRCINFO` to the AUR repo for `mobvibe-cli-git`.

## Notes

- `pkgver()` follows the latest git tag, for example `0.1.46.r2.g43f28e3`.
- The package intentionally does not install `bin/mobvibe.mjs`; that file is the npm launcher, not the native binary used on Arch.
