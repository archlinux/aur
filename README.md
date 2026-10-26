# nperf-gui-appimage (Arch Linux PKGBUILD)

Arch Linux `PKGBUILD` that packages the official **nPerf** GUI network speed-test
client for Linux, distributed upstream as an AppImage
([nperf.com](https://www.nperf.com/)).

This is the source repository of the
[AUR `nperf-gui-appimage`](https://aur.archlinux.org/packages/nperf-gui-appimage)
package, which I maintain since October 2026. The original packaging is the work
of the previous maintainer, credited as a contributor in the `PKGBUILD` header.

## What it does

Downloads the upstream `nPerf-<version>-x86_64.AppImage`, installs it under
`/opt/appimages/`, adds a launcher script at `/usr/bin/nperf-gui`, and installs
the desktop entry for menu integration.

## Building & installing

```bash
git clone https://github.com/FoxKyong/aur-nperf-gui-appimage.git
cd aur-nperf-gui-appimage
makepkg -si
```

Requires `fuse` (fuse2) at runtime to run the AppImage.

## Updating to a new version

nPerf's Linux downloads live at `https://repo.nperf.com/linux/nperf/`. To bump:

1. Set `pkgver` to the new version (verify the AppImage exists at that URL first).
2. Regenerate the checksum: `makepkg -g` and paste the printed `sha256sums=(...)`.
3. Regenerate metadata: `makepkg --printsrcinfo > .SRCINFO`.
4. Verify it builds: `makepkg -f`.

## Publishing

`main` is pushed to GitHub and, as `master`, to the AUR (which only accepts
`master`). The `aur` remote is configured to do that mapping:

```bash
git remote add aur ssh://aur@aur.archlinux.org/nperf-gui-appimage.git
git config remote.aur.push refs/heads/main:refs/heads/master
git push origin && git push aur
```

## License

The packaging files in this repository are licensed under [0BSD](LICENSE).

nPerf itself is proprietary freeware with no published source, hence
`license=('LicenseRef-nPerf')` in the `PKGBUILD`. The AppImage is downloaded
from nPerf's servers during the build and is not part of this repository.
