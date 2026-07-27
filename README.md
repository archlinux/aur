# meguri-bin

AUR package for [Meguri](https://github.com/zabuton-app/meguri), a local video
and image browser with thumbnails, search, and playback.

This package repackages the official Linux AppImage release. The AppImage
contents are extracted at build time and installed under `/opt/meguri-bin`,
so the app runs from real files instead of a FUSE-mounted squashfs (better
runtime performance) and with the Chromium setuid sandbox enabled.

- AUR page: <https://aur.archlinux.org/packages/meguri-bin>
- Upstream: <https://github.com/zabuton-app/meguri>

## Installation

With an AUR helper:

```bash
paru -S meguri-bin
# or
yay -S meguri-bin
```

Manually:

```bash
git clone https://aur.archlinux.org/meguri-bin.git
cd meguri-bin
makepkg -si
```

## Repository layout

This GitHub repository is a mirror of the AUR package repository
(`ssh://aur@aur.archlinux.org/meguri-bin.git`). The AUR is the canonical
location; changes are pushed there first and mirrored here.

Only the packaging files are tracked:

- `PKGBUILD` — build recipe
- `.SRCINFO` — generated metadata (`makepkg --printsrcinfo > .SRCINFO`)

## License

The packaging files in this repository are provided under the same MIT
license as Meguri itself. See the upstream
[LICENSE](https://github.com/zabuton-app/meguri/blob/main/LICENSE).

## Issues

For problems with the application itself, use the
[upstream issue tracker](https://github.com/zabuton-app/meguri/issues).
For packaging issues, comment on the
[AUR page](https://aur.archlinux.org/packages/meguri-bin) or open an issue
here.
