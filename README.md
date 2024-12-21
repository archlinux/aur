# OBS for Arch Linux with websockets

This is a temporary hack, until this gets merged:

https://bugs.archlinux.org/task/76710?project=5&string=obs-studio
https://github.com/obsproject/obs-studio/pull/7475

The github action in this repository creates a tarball with alle the plugins (including websockets). To install it, run:

```
git clone https://github.com/tbocek/obs-source-all.git
MAKEFLAGS="-j$(nproc)" makepkg -Acs
sudo pacman -U obs-studio-31.0.0-2-x86_64.pkg.tar.zst
```

This version includes Websockets, but disables NVenc.