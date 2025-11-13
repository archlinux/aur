nonraid-dkms AUR scaffold
-------------------------

This directory contains a ready-to-submit AUR package for nonraid with:
- DKMS integration (sources installed into /usr/src/nonraid-${pkgver})
- tools/nmdctl installed into /usr/bin (if present upstream)
- systemd services/timers from tools/systemd/
- default config tools/nonraid.default into /etc/default/nonraid
- udev rule tools/udev/nonraid.udev installed as /usr/lib/udev/rules.d/99-nonraid.rules

How to test locally on Arch:
  1) pacman -S --needed base-devel git dkms linux-headers
  2) makepkg -si

Notes:
  - The DKMS configuration falls back to a generated dkms.conf if none is present upstream.
    If upstream provides dkms.conf or a 'dkms/' directory, those are used instead.
  - Adjust license in PKGBUILD if upstream ships a known license.
  - Enabling systemd units is not automatic; enable what you need manually.
