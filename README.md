# ayugram-bin

AUR package for [AyuGram Desktop](https://github.com/AyuGram/AyuGramDesktop) — a Telegram Desktop fork with Ghost Mode, anti-recall, and privacy/customization features.

This is a **binary** package sourcing the pre-built binary directly from the [CachyOS repository](https://packages.cachyos.org/package/cachyos/x86_64/ayugram-desktop).

## Installation

```sh
git clone https://aur.archlinux.org/ayugram-bin.git
cd ayugram-bin
makepkg -si
```

Or with an AUR helper:

```sh
yay -S ayugram-bin
paru -S ayugram-bin
```

## Notes

- `x86_64` only
- Conflicts with `ayugram-desktop`, `ayugram-desktop-bin`, `ayugram-desktop-git`
- Provides `ayugram-desktop` for dependency resolution

## Maintainer

Mehrab Mahmud Udoy (`@rimehrab`) — <contact@rimehrab.is-a.dev>
