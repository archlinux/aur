# herta-bin

Arch Linux packaging for [Herta](https://github.com/PersonaCLI/Herta), the
desktop companion built on DeepSeek.

This repository is the source of the `herta-bin` package on the
[AUR](https://aur.archlinux.org/packages/herta-bin). It repacks the official
upstream AppImage: only the application payload (`resources/`) is installed,
and the Chromium runtime comes from Arch's `electron43` package. That keeps the
installed size around 67 MiB instead of the 334 MiB the AppImage's bundled
Electron would take, and lets Electron security updates arrive through pacman.

## Install

```sh
paru -S herta-bin     # or: yay -S herta-bin
```

## Layout

| Path | Purpose |
| --- | --- |
| `/usr/bin/herta` | launcher (`herta.sh`) |
| `/usr/lib/herta-bin/resources` | application payload |
| `/usr/share/applications/herta.desktop` | desktop entry |

Upstream's LICENSE excludes character artwork, canon text and the voice clips
from the MIT grant (they are fan content). This package does not redistribute
any of it: `makepkg` fetches the AppImage from the project's own release page.

## Remotes

`origin` is this GitHub mirror; `aur` is `ssh://aur@aur.archlinux.org/herta-bin.git`.
Push a new release to both:

```sh
makepkg --printsrcinfo > .SRCINFO
git commit -am "herta-bin <version>"
git push origin master && git push aur master
```
