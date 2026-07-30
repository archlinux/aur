<div align="center">
  <h1>nautilus-dummy</h1>
  <p><b>Dummy package to satisfy nautilus dependency</b></p>

This is a dummy package to satisfy nautilus dependency of many gnome components.

</div>

---

## Installation

> [!WARNING]
> This package doesn't install the actual file manager.  
> Must install any other file manager you want.

### Arch Linux

#### 1. Using AUR Helper

```bash
# Using an AUR helper (e.g., yay, paru)
paru -S nautilus-dummy
```

#### 2. Manually

```bash
# Clone repo & cd into it
git clone https://aur.archlinux.org/nautilus-dummy && cd nautilus-dummy
# Build package
makepkg
# Install the package
sudo pacman -U nautilus-dummy-*.pkg.tar.zst
```

## Portals Setup

If you have use case where you have to use gnome portal (such as niri), setup guides are below:

1. install `xdg-desktop-portal-gtk`.
2. Add below to `~/.config/xdg-desktop-portal/portals.conf`:
   ```ini
     [preferred]
     default=gtk;gnome

     # Use GNOME for the technical bits
     org.freedesktop.impl.portal.ScreenCast=gnome
     org.freedesktop.impl.portal.Screenshot=gnome

   ```
