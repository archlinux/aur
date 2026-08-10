# kizami-bin

AUR package for [kizami](https://github.com/zabuton-app/kizami), a
tray-resident pomodoro timer with a mini window mode.

This package repackages the official Linux AppImage release. The AppImage
contents are extracted at build time and installed under `/opt/kizami-bin`,
so the app runs from real files instead of a FUSE-mounted squashfs (better
runtime performance) and with the Chromium setuid sandbox enabled.

- AUR page: <https://aur.archlinux.org/packages/kizami-bin>
- Upstream: <https://github.com/zabuton-app/kizami>

## Installation

With an AUR helper:

```bash
paru -S kizami-bin
# or
yay -S kizami-bin
```

Manually:

```bash
git clone https://aur.archlinux.org/kizami-bin.git
cd kizami-bin
makepkg -si
```

## Repository layout

This GitHub repository is a mirror of the AUR package repository
(`ssh://aur@aur.archlinux.org/kizami-bin.git`). The AUR is the canonical
location; changes are pushed there first and mirrored here.

Only the packaging files are tracked:

- `PKGBUILD` — build recipe
- `.SRCINFO` — generated metadata (`makepkg --printsrcinfo > .SRCINFO`)

## License

The packaging files in this repository are provided under the same MIT
license as kizami itself. See the upstream
[LICENSE](https://github.com/zabuton-app/kizami/blob/main/LICENSE).

## Issues

For problems with the application itself, use the
[upstream issue tracker](https://github.com/zabuton-app/kizami/issues).
For packaging issues, comment on the
[AUR page](https://aur.archlinux.org/packages/kizami-bin) or open an issue
here.
