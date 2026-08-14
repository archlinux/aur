# gitcommitgenerator-bin AUR package

This repository contains the AUR packaging files for:

https://github.com/SunParis/GitCommitGenerator

The package installs the prebuilt `gitcommitgenerator` binary from a GitHub
release archive, so the AUR package name is `gitcommitgenerator-bin`.

## Release artifact expected by PKGBUILD

For each upstream `vX.Y.Z` release, publish this asset:

```text
gitcommitgenerator-vX.Y.Z-x86_64-unknown-linux-gnu.tar.gz
```

The archive must contain the executable at its top level:

```text
gitcommitgenerator
```

`PKGBUILD` downloads the license separately from the matching Git tag.

After uploading the asset, replace `sha256sums_x86_64=('SKIP')` in `PKGBUILD`
with the real checksum:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
./check.sh --release
```

## Local checks

```bash
./check.sh
```

The checks validate that `.SRCINFO` is in sync with `PKGBUILD`, that required
AUR metadata is present, and that `namcap` accepts the `PKGBUILD` when available.
Use `./check.sh --release` after uploading the GitHub release asset; it
also rejects placeholder checksums and verifies the source archive.
