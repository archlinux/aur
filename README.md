# media-server (AUR)

Arch Linux packaging for [media-server](https://github.com/dog4ik/media-server).

This repository holds the `PKGBUILD` and install hooks only; the application
itself lives in the main repo. The package builds the server from the tagged
source (using the committed `.sqlx` offline cache, so no `sqlx-cli` or database is
needed) and bundles the matching prebuilt web client release.

## Build & install locally

```sh
makepkg -si
```

## Maintaining

When releasing a new version:

1. Bump `pkgver` to the new server tag and `_webver` to the matching web-client
   release (same minor version).
2. Refresh checksums: `updpkgsums`.
3. Regenerate metadata: `makepkg --printsrcinfo > .SRCINFO`.
4. Test a clean build: `makepkg -f`.
5. Commit `PKGBUILD`, `.SRCINFO` and `media-server.install`, then push to AUR.
