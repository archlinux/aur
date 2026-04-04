# xscreensaver-tray

A system tray toggle application for xscreensaver.

WARNING: This was made with an llm. I am not a programmer by any means.
This program was made for a problem I had and figured I'd share my solution
to the masses. I doubt this package will be maintained unless I need to update it for
some reason. This is your warning.

## Features

- Quick toggle for XScreenSaver from the system tray
- Lightweight and easy to use
- Works with KDE and XFCE (probably more)

## Bugs/Quirks

- On install you need to restart to use
- On remove XFCE fonts can get messed up. Just restart, that should fix it.

## Installation

### From AUR

```bash
yay -S xscreensaver-tray
# or
paru -S xscreensaver-tray
```


###  manual build:

```bash
git clone https://aur.archlinux.org/xscreensaver-tray.git
cd xscreensaver-tray
makepkg -si
```
