# asus-vs229h-edid-firmware

A fixed EDID blob for the **ASUS VS229H** 1080p monitor, plus a helper that
installs, checks and removes the override.

## Why this package exists

The EEPROM of (at least some units of) the VS229H stores a **wrong checksum
byte** in EDID block 0: it reads `0xa6` while the data requires `0x07`.
Reading the EDID over DDC works fine and is perfectly reproducible — even a
single-byte I2C read of offset 127 returns `0xa6` — so the corruption is in the
monitor itself, not in the cable or the driver.

Because `drm_edid_valid()` rejects an EDID with a bad block checksum, the driver
throws the whole EDID away and falls back to generic modes:

```
nvidia-modeset: WARNING: GPU:0: Unable to read EDID for display device HDMI-0
/sys/class/drm/card0-HDMI-A-1/edid   -> 0 bytes
/sys/class/drm/card0-HDMI-A-1/modes  -> 1024x768, 800x600, 640x480
```

The monitor then shows up as "Unknown display" and 1920x1080 is not offered.
This is a monitor-side defect, not a driver regression: the warning is present
in years of logs, long before the last driver update.

This package ships the very same EDID dumped from the monitor with only the
checksum byte recomputed — header, timings and the CTA extension block are
untouched — so the driver accepts it and the full mode list, including
1920x1080@60, becomes available.

## Files

| Path | Purpose |
| --- | --- |
| `/usr/lib/firmware/edid/asus-vs229h.bin` | the fixed EDID (256 bytes: base block + CTA extension) |
| `/usr/bin/asus-vs229h-edid` | helper: `status` / `verify` / `on` / `off` / `apply` / `refresh` |
| `/usr/lib/systemd/system/asus-vs229h-edid.service` | optional early-boot override (no bootloader changes) |
| `/usr/share/doc/asus-vs229h-edid-firmware/asus-vs229h.edid.hex` | the blob in reviewable hex form |

## Enabling it

The override is a DRM core parameter, so the cleanest way is to pass it from the
bootloader. With GRUB:

```sh
asus-vs229h-edid on      # edits /etc/default/grub and runs grub-mkconfig
systemctl reboot
```

The equivalent manual change in `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="... drm.edid_firmware=HDMI-A-1:edid/asus-vs229h.bin"
```

If you would rather not touch the bootloader, enable the bundled unit instead.
It writes `/sys/module/drm/parameters/edid_firmware` early in boot (after the
udev queue settles, before the display manager) and re-probes the connector:

```sh
systemctl enable asus-vs229h-edid.service
```

`asus-vs229h-edid apply` does the same thing on a running system. Note that the
compositor only re-reads the mode list after a cable re-plug or a session
restart, and some drivers honour the EDID file only when the connector is
registered — `apply` tells you when a reboot is needed instead.

To undo everything: `asus-vs229h-edid off`, or `systemctl disable
asus-vs229h-edid.service`.

If your GPU driver lives in the initramfs, add the blob to `FILES=` in
`/etc/mkinitcpio.conf` and rebuild it (`mkinitcpio -P`); otherwise the file is
simply read from `/usr/lib/firmware` once the root filesystem is mounted. When
you remove this package, remember to delete that `FILES=` line again —
otherwise mkinitcpio fails because the file is gone.

## Checking

```
$ asus-vs229h-edid status
=== EDID file ===
block 0: checksum OK
block 1: checksum OK
header: OK (00ffffffffffff00)
EDID is usable: /usr/lib/firmware/edid/asus-vs229h.bin (256 bytes, 2 block(s))

=== override ===
bootloader parameter (GRUB): enabled
kernel value: 'HDMI-A-1:edid/asus-vs229h.bin' — as expected
expected parameter: drm.edid_firmware=HDMI-A-1:edid/asus-vs229h.bin

=== connector ===
path: /sys/class/drm/card0-HDMI-A-1
status: connected, EDID in sysfs: 0 bytes
modes: 38, first: 1920x1080
1920x1080: PRESENT
```

(`EDID in sysfs: 0 bytes` is expected — nvidia-drm does not export the override
through sysfs, but the mode list proves it was accepted.)

## Your own panel

The blob carries the serial number of the reporter's panel (`B8LMTF005952`);
everything else in it is per-model. To get an exact copy of your own monitor,
dump it from the DDC bus and let the tool repair the checksum:

```sh
i2cdetect -l                       # find the "NVIDIA i2c adapter …" bus
asus-vs229h-edid refresh 8         # bus number from the previous command
```

If `refresh` reports "the monitor EDID is already valid", your unit is not
affected and the override is unnecessary.

The connector name can be overridden with `EDID_CONNECTOR=HDMI-A-2` when your
port is enumerated differently.

## Notes

* The override is bound to the **connector**, not to the monitor: plug a
  different display into the same HDMI port and it will get this EDID too.
  Turn the override off in that case.
* A harmless warning may stay in the kernel log: `RLD advertized maximum pixel
  clock 170000 KHz violates maximum pixel clock constraint for HDMI`. The
  panel's EDID advertises 170 MHz while the driver caps HDMI at 165 MHz;
  1920x1080@60 needs 148.35 MHz, so nothing is affected.
* Tested with `nvidia-open` 620.73.04 + `nvidia-drm.modeset=1` on GNOME/Wayland
  (hybrid Intel UHD + GTX 1650 Mobile). The monitor is detected at
  1920x1080@60 and comes back correctly from suspend.

## Кратко по-русски

Монитор отдаёт корректный по содержимому EDID, но с испорченным байтом
контрольной суммы в EEPROM (`0xa6` вместо `0x07`), поэтому DRM отбрасывает его и
предлагает только 1024x768. Пакет кладёт тот же EDID с пересчитанной суммой в
`/usr/lib/firmware/edid/`, а `asus-vs229h-edid on` добавляет
`drm.edid_firmware=HDMI-A-1:edid/asus-vs229h.bin` в загрузчик (альтернатива —
юнит `asus-vs229h-edid.service`, который применяет подмену на раннем этапе
загрузки, не трогая GRUB).

## License

Scripts and packaging: GPL-3.0-or-later. The EDID blob is device data dumped
from a VS229H unit and is provided as-is.
