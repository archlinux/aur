# libfprint-2-tod1-synaptics009a

Native `libfprint-2-tod1` driver for the Synaptics "Metallica MIS Touch"
fingerprint reader, USB ID **`06cb:009a`**, as found in the Lenovo ThinkPad
**T480 / T480s / X280 / P52s**. It runs under stock `fprintd` — no Python
daemon, no `open-fprintd`.

## Install

If you have the old `python-validity` / `open-fprintd` stack, remove it first —
it replaces `fprintd` and claims the same sensor, so the two can't coexist:

    paru -Rns python-validity open-fprintd fprintd-clients-git
    yay  -Rns python-validity open-fprintd fprintd-clients-git

Then install this driver:

    paru -S libfprint-2-tod1-synaptics009a
    yay  -S libfprint-2-tod1-synaptics009a

Or build it yourself:

    git clone https://github.com/hustles/libfprint-2-tod1-synaptics009a
    cd libfprint-2-tod1-synaptics009a
    makepkg -si

## Set up the reader (once)

    sudo synaptics009a-setup

This flashes the sensor's firmware extension (the step that makes the reader
work at all), generates the calibration, and restarts `fprintd`. Then:

    fprintd-enroll -f right-index-finger    # 12 presses
    fprintd-verify                          # must print: verify-match

This is a **press** sensor, not a swipe: press the whole oval firmly, hold a
moment, lift off, and vary the angle between presses.

## Optional: use it for sudo and login

    sudo synaptics009a-pam              # add pam_fprintd to /etc/pam.d/system-auth
    sudo synaptics009a-pam --undo       # remove it again

The module is `sufficient`, so a swipe satisfies `sudo` from any background
process (CVE-2024-37408) and skips faillock. Fine for a personal laptop; know
the trade.

## Troubleshooting

- **`No devices available`** — `systemctl status fprintd`; check nothing else
  holds the sensor.
- **Sensor resets mid-capture** — `synaptics009a-upload-fwext --check`; if it
  says `ABSENT`, run the setup step above.
- **Enrolled but never matches** — `fprintd-delete "$USER"`, re-enrol, and press
  the oval more firmly.

## What gets installed

    /usr/lib/libfprint-2/tod-1/libfprint-2-tod1-synaptics009a.so   the driver
    /usr/bin/synaptics009a-setup                                  firmware + calibration, once
    /usr/bin/synaptics009a-upload-fwext                           firmware only (--check to inspect)
    /usr/bin/synaptics009a-pam                                    sudo/login
    /usr/lib/udev/rules.d/60-synaptics-009a.rules                 keeps the reader powered

## Credits

Driver upstream: `t480s-fingerprint-driver-for-linux` (MIT OR LGPL-2.1-or-later).
Capture programs and initialisation blobs originate in Synaptics' Windows driver
and are reproduced as `python-validity` distributes them; see
`LICENSE.python-validity`. The firmware extension is downloaded from Lenovo's
official driver package (`nz3gf07w.exe`) and is not redistributed here.
