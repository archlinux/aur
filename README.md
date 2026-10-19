# kosmozoo

AUR package for [Kosmozoo](https://github.com/alexindigo/kosmozoo), a local
review and curation app for ComfyUI image output. Builds the client and runs
the release source with Arch's `deno` and `sqlite` packages. This package is
not the official compiled executable.

## Dependencies

Runtime and build: `deno`, `sqlite`. Runtime also uses `hicolor-icon-theme`.
Build tools: Arch `base-devel`, `git`.

## Building

```sh
makepkg -si
```

## Maintenance

`PKGBUILD` defines the release source and checksums; `kosmozoo.sh` launches the
installed source with its cached dependencies. `.SRCINFO` contains generated
AUR metadata. `LICENSE` covers the packaging files; the application is
LGPL-3.0-only.

Install the tracked hook after cloning:

```sh
cp pre-commit.sh .git/hooks/pre-commit
```

The hook regenerates `.SRCINFO` and runs `namcap PKGBUILD` when `PKGBUILD` is
staged. Update the source checksum for a new upstream version; bump `pkgrel`
for packaging-only changes.
