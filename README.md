# kali-themes-ansulev

Kali Linux's desktop look on Arch: the GTK and Qt themes, the Flat-Remix icon sets, the
Kali menu and panel icons, wallpapers and the XFCE panel profiles, built from Kali's own
[kali-themes](https://gitlab.com/kalilinux/packages/kali-themes) source.

This is a maintained fork of the AUR `kali-themes` package. It `provides` and `conflicts`
with `kali-themes`, so it takes that package's place and anything that depends on
`kali-themes` keeps working.

## Why a fork

The AUR package is behind upstream and copies only some of the `share/` trees. Both
ship the GTK themes, Flat-Remix icons, Qt/KDE colour schemes, GtkSourceView styles and
the qtermwidget and Konsole schemes. This one adds the rest:

| | AUR `kali-themes` | `kali-themes-ansulev` |
|---|---|---|
| Upstream version | 2026.1.1 | 2026.3.0 |
| Upstream `make install` (emblems, Kali logos, XFCE panel profiles) | no | yes |
| Wallpapers (`share/backgrounds`) | no | yes |
| xfce4-terminal and Tilix colour schemes | no | yes |
| `share/kali-themes` and `share/applications` helpers | no | yes |

Themes come in the default blue plus 8 accents (Green, Orange, Pink, Purple, Red, Slate,
Teal, Yellow), each Dark and Light. Each also has an `-xHiDPI` xfwm4 theme for 2x screens.

## What it deliberately skips

Kali's Debian integration for gdm, sddm, GRUB, plymouth defaults, `desktop-base` and
`/etc` is not installed. Those files overwrite Arch defaults. The plymouth theme files
are shipped, but nothing switches your boot splash.

## Install

```bash
git clone https://aur.archlinux.org/kali-themes-ansulev.git
cd kali-themes-ansulev
makepkg -si
```

If `kali-themes` is installed, pacman asks to remove it first (the two conflict).

## Use

- GTK: pick `Kali-Dark` or `Kali-Light` (or an accent, e.g. `Kali-Teal-Dark`).
- xfwm4: the same name, or its `-xHiDPI` variant on a 2x screen.
- Icons: `Flat-Remix-Blue-Dark` (or another Flat-Remix variant).
- XFCE panel: `xfce4-panel-profiles`, then load the `Kali` or `Kali compact` layout.
- Qt: choose the Kali colour scheme in qt5ct / qt6ct.

## Credits

Themes and artwork: the Kali Linux team. Earlier AUR packaging: Ward Segers and saying.
Licence: GPL-3.0, same as upstream.

## Issues

Comment on the [AUR page](https://aur.archlinux.org/packages/kali-themes-ansulev).
