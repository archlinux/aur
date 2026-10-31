# atk-logic-bin

Arch Linux packaging for **ATK-Logic**, ALIENTEK's desktop software for their ATK logic analyzers. It captures and displays signals, measures timing, decodes protocols (built on libsigrokdecode), and exports captures to CSV.

This repository has two jobs:

- **Mirror.** The [Releases](https://github.com/kellyiscute/atk-logic-bin/releases) page hosts unmodified copies of ALIENTEK's official `.deb` builds. ALIENTEK doesn't publish a stable direct download URL, so the AUR package [`atk-logic-bin`](https://aur.archlinux.org/packages/atk-logic-bin) downloads from here.
- **Packaging.** The `PKGBUILD` repackages that `.deb` for Arch Linux.

## Upstream

- **Documentation and official downloads:** https://www.openedv.com/docs/tool/luojifenxiyi/DL16.html
- **Original source code (GPL-3.0-or-later):** https://github.com/alientek-openedv/atk-logic

I'm not affiliated with ALIENTEK. For questions about the software itself, see their documentation. Report packaging problems here or on the AUR page.

## Install

With an AUR helper:

```sh
paru -S atk-logic-bin   # or: yay -S atk-logic-bin
```

Or build it manually:

```sh
git clone https://aur.archlinux.org/atk-logic-bin.git
cd atk-logic-bin
makepkg -si
```

Then run `atk-logic`, or open **ATK-Logic** from your application menu.

## Changes from the official `.deb`

- The app is installed to `/opt/atk-logic` instead of `/opt/apps/atk-logic`.
- An `atk-logic` launcher is added to `/usr/bin`.
- File permissions are normalized. The `.deb` ships many files world-writable (0777).
- The menu entry points at the new launcher and icon location.
- ALIENTEK's udev rules are installed to `/usr/lib/udev/rules.d/99-atk-logic-usb.rules`. They let non-root users access the analyzer over USB.

The application binaries and bundled libraries are untouched.

## Notes

- ATK-Logic is X11-only. On a Wayland session, install `xorg-xwayland`.
- After installing, unplug and replug the analyzer so the udev rules apply.
- Settings are stored in `~/.local/share/ALIENTEK/ATK-LogicView`.

## Verifying the mirror

Every release lists the SHA-256 of the `.deb`, and the same checksum is pinned in the `PKGBUILD`:

```
8353b5866a7bfdf41a7573b223057711c42ffeb791eca36d4fe739934f559954  ATK-Logic_1.1.2.2_amd64.deb
```
