# DeskWaifu binary packages for Arch Linux

This AUR repository repackages the public x86_64 binaries from the fixed GitHub
Release in `PKGBUILD`. It does not compile DeskWaifu or download the Cubism SDK.
One split recipe produces `deskwaifu-bin` and the optional `deskwaifu-ocr-bin`.
Both assets are downloaded; installing the OCR package is optional.

```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/deskwaifu-bin.git
cd deskwaifu-bin
makepkg -s
sudo pacman -U ./deskwaifu-bin-*.pkg.tar.zst
# Optional: install the matching deskwaifu-ocr-bin package as well.
```

Run makepkg as a regular user. Alternatively, use `yay -S deskwaifu-bin` or
`yay -S deskwaifu-ocr-bin`. The OCR package requires the exact main package
version, OpenCV and yaml-cpp; models and dictionaries must be supplied separately.

Use a Wayland compositor supporting layer-shell, such as Hyprland or Sway.
Start `deskwaifu`, then `deskwaifu-control`. The control panel does not start
the backend. Models belong in `$XDG_CONFIG_HOME/deskwaifu/models/` (default:
`~/.config/deskwaifu/models/`). Packages do not configure autostart or modify
user configuration. Remove conflicting source packages when switching variants.

The Live2D Core/SDK-derived code is subject to Live2D's proprietary and open
software license agreements; see the notices under
`/usr/share/licenses/deskwaifu-bin/` and https://www.live2d.com/eula/.

## Maintenance

The main DeskWaifu repository mounts this repository at `packaging/aur/`.
Run `python3 scripts/update-aur.py TAG` from that repository to verify a public
Release and update this recipe. Review the diff and test with makepkg/namcap
before committing. The tool never commits or pushes. Refresh `.SRCINFO` with
`makepkg --printsrcinfo > .SRCINFO` after manual edits.

The Gitea build workflow, source-build template, and update tool live in the main
repository, not here. Do not commit binary packages, downloaded SDKs or caches.
