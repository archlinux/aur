# libfprint-2-tod1-synaptics009a

Native `libfprint-2-tod1` driver for the **Synaptics "Metallica MIS Touch"**
fingerprint reader, USB ID **`06cb:009a`**, as found in the Lenovo ThinkPad
**T480 / T480s / X280 / P52s**. It runs under stock `fprintd` (no Python daemon,
no `open-fprintd`), and supports enrolment, verification, deletion, and PAM
login/unlock.

## Install

**If you have the `python-validity` / `open-fprintd` stack installed, remove it
first.** It replaces `fprintd` and claims the same reader, so the two cannot
coexist:

    paru -Rns python-validity open-fprintd fprintd-clients-git

`fprintd-clients-git` is the patched client half of that stack and conflicts
with stock `fprintd`, while `open-fprintd` and `python-validity` depend on it —
leave either behind and you have two drivers competing for one sensor. Confirm
the stock daemon is back before continuing:

    sudo pacman -S --needed fprintd

Then install this driver:

    paru -S libfprint-2-tod1-synaptics009a

Or from git:

    git clone https://github.com/hustles/libfprint-2-tod1-synaptics009a
    cd libfprint-2-tod1-synaptics009a
    makepkg -si

## Then run the one-time setup

The install prints this, but to be explicit:

    sudo synaptics009a-setup

That does three things, skipping any step already done:

1. **Flashes the QMatcher firmware extension** (`6_07f_lenovo_mis_qm.xpfwext`)
   into the sensor's flash partition 2. *This is the step that makes the reader
   work at all.* A `06cb:009a` without its firmware extension accepts the TLS
   session and the first small command, then faults and re-enumerates on the
   first large capture command — so enrolment can never complete. Upstream
   leaves this to `python-validity`; this package does it natively.
2. **Generates the per-sensor host calibration** into
   `/var/lib/fprint/.synaptics_06cb_009a_calib.bin` (keep your hands off the
   reader while it runs).
3. Restarts `fprintd`.

Then:

    fprintd-enroll -f right-index-finger
    fprintd-verify                       # must print "verify-match"

This is a **press** sensor, not a swipe: press the whole oval firmly, hold a
moment, lift off, and vary the angle between touches.

## Optional: sudo and login

    sudo synaptics009a-pam              # add pam_fprintd to /etc/pam.d/system-auth
    sudo synaptics009a-pam --undo       # remove it again

One line at the top of `system-auth` covers `sudo`, the display manager and tty
login on Arch. Because the module is `sufficient`, a successful swipe
short-circuits the auth stack: any background process can satisfy `sudo` with a
swipe (CVE-2024-37408), and `pam_env` / the faillock preauth are skipped on the
fingerprint path. Fine for a personal laptop; know the trade.

## Package layout

| Path | What |
|---|---|
| `/usr/lib/libfprint-2/tod-1/libfprint-2-tod1-synaptics009a.so` | the driver plugin |
| `/usr/bin/synaptics009a-calibrate` | generate the host calibration |
| `/usr/bin/synaptics009a-upload-fwext` | flash the firmware extension (`--check` reports only) |
| `/usr/bin/synaptics009a-setup` | run both of the above once |
| `/usr/bin/synaptics009a-pam` | enable/disable PAM auth |
| `/usr/share/libfprint-2-tod1-synaptics009a/6_07f_lenovo_mis_qm.xpfwext` | vendor firmware |
| `/usr/lib/udev/rules.d/60-synaptics-009a.rules` | keeps the reader powered |
| `/usr/lib/systemd/system/fprintd.service.d/synaptics009a-no-timeout.conf` | `fprintd -t` (keep the TLS session warm) |

## Troubleshooting

- **`No devices available`** — `systemctl status fprintd`; make sure nothing else
  holds the sensor (`python3-validity`, `open-fprintd`).
- **Sensor drops mid-capture** (`No such device`) — check
  `cat /sys/bus/usb/devices/*/power/control`; the udev rule should force `on`.
- **Calibration/enrolment resets the chip** — run
  `synaptics009a-upload-fwext --check`; if it reports `ABSENT`, the firmware
  extension is missing and `sudo synaptics009a-setup` will flash it.
- **Enrolled but verification never matches** — delete and re-enrol once
  (`fprintd-delete "$USER"`), and press the oval more firmly.

## Credits and licence

Driver upstream: `t480s-fingerprint-driver-for-linux` (MIT OR LGPL-2.1-or-later).
Capture programs and initialisation blobs originate in Synaptics' Windows
driver and are reproduced as `python-validity` distributes them; see
`LICENSE.python-validity`. The firmware extension is downloaded from Lenovo's
official driver package (`nz3gf07w.exe`) and is not redistributed here.
