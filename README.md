# openchamber-bin

AUR packaging files for the official x86_64 OpenChamber AppImage, installed as
an extracted AppDir under `/opt/openchamber-bin`.

## Before publishing

1. Replace the maintainer placeholder at the top of `PKGBUILD`.
2. Build and test on Arch Linux.
3. Verify the extracted AppDir and runtime dependencies on your system.
4. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.

The package intentionally uses `/usr/bin/openchamber-desktop` so it does not
overwrite the `openchamber` command provided by the separate Node.js package.
It conflicts with the other AUR desktop packages because they install the same
application integration.

The AUR repository should contain packaging metadata and license files only,
not the downloaded AppImage or built package archive.
