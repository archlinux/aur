# kosmozoo-bin

AUR package for [Kosmozoo](https://github.com/alexindigo/kosmozoo), a local
review and curation app for ComfyUI image output. Downloads only the official Linux
x86_64 executable and uses its `package-resources` command to generate the global
desktop, icon, user-service, license, notice and documentation files.

## Dependencies

Runtime: `glibc`, `libgcc`, `hicolor-icon-theme`. Build tools: Arch `base-devel`.

## Building

```sh
makepkg -si
```

## Maintenance

`PKGBUILD` defines the release executable and checksum; `.SRCINFO` contains the
generated AUR metadata. `LICENSE` covers the packaging files; the application
is LGPL-3.0-only.

Install the tracked hook after cloning:

```sh
cp pre-commit.sh .git/hooks/pre-commit
```

The hook regenerates `.SRCINFO` and runs `namcap PKGBUILD` when `PKGBUILD` is
staged. Update release checksums for a new upstream version; bump `pkgrel` for
packaging-only changes.
