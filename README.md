# mediatek-mt7927-dkms

DKMS driver for MediaTek MT7927 (Filogic 380) - WiFi 7 + Bluetooth 5.4 on Linux.

Builds out-of-tree btusb/btmtk (Bluetooth) and mt76 (WiFi) kernel modules with
device ID and firmware patches not yet in mainline. Supports kernels 6.17+.

## Status

| Component | Status | Details |
|-----------|--------|---------|
| Bluetooth (MT6639 via USB) | **WORKING** | Patched btusb with device ID + firmware |
| WiFi (MT7925e via PCIe) | **WORKING** | 2.4/5/6 GHz, 320MHz EHT, PM, suspend/resume |

**Known issues:**
- TX retransmissions elevated vs baseline (firmware-side, not driver-fixable) ([#26](https://github.com/jetm/mediatek-mt7927-dkms/issues/26))
- Bluetooth USB device may disappear after module reload or DKMS upgrade, persists
  across reboots. Workaround: shut down, unplug PSU / switch off at back, wait 10
  seconds, power back on. A regular reboot is not enough - the MT6639 BT firmware
  locks up and only recovers with a full power drain.
  ([#23](https://github.com/jetm/mediatek-mt7927-dkms/issues/23))

**Recently fixed (v2.6):**
- 5/6 GHz WPA 4WAY_HANDSHAKE_TIMEOUT - fixed by explicit band_idx assignment ([#24](https://github.com/jetm/mediatek-mt7927-dkms/issues/24))
- test-driver.sh false PASSED when checks actually failed ([#31](https://github.com/jetm/mediatek-mt7927-dkms/issues/31))

## Supported hardware

| Device | BT USB ID | WiFi PCI ID |
|--------|-----------|-------------|
| ASUS ROG Crosshair X870E Hero | 0489:e13a | 14c3:7927 |
| ASUS ProArt X870E-Creator WiFi | 13d3:3588 | 14c3:6639 |
| ASUS ROG Strix X870-I | - | 14c3:7927 |
| ASUS ROG Strix X870E-E | 13d3:3588 | 14c3:7927 |
| Gigabyte X870E Aorus Master X3D | 0489:e10f | 14c3:7927 |
| Gigabyte Z790 AORUS MASTER X | 0489:e10f | 14c3:7927 |
| Gigabyte Z790 AORUS ELITE X WiFi7 | 0489:e10f | 14c3:7927 |
| MSI MEG X870E ACE MAX | 0489:e110 | 14c3:7927 |
| Lenovo Legion Pro 7 16ARX9 | 0489:e0fa | 14c3:7927 |
| Lenovo Legion Pro 7 16AFR10H | 0489:e0fa | 14c3:7927 |
| TP-Link Archer TBE550E PCIe | 0489:e116 | 14c3:7927 |
| EDUP EP-MT7927BE M.2 | - | 14c3:7927 |
| Foxconn/Azurewave M.2 modules | - | 14c3:6639 |
| AMD RZ738 (MediaTek MT7927) | - | 14c3:0738 |

Check if your hardware is detected:

```bash
lspci | grep -i 14c3          # WiFi (PCIe)
lsusb | grep -iE '0489|13d3|0e8d'  # Bluetooth (USB)
```

## Naming guide

MediaTek naming is confusing - see
[MT7927 WiFi: The Missing Piece](https://jetm.github.io/blog/posts/mt7927-wifi-the-missing-piece/)
for the full story. Here's the short version:

```text
MT7927 = combo module on the motherboard (WiFi 7 + BT 5.4, Filogic 380)
  ├─ BT side:   internally MT6639, connects via USB
  └─ WiFi side: architecturally MT7925, connects via PCIe
```

**MT7902** is a separate WiFi 6E chip (different product line, uses mt7921 driver).
It's included in this package at zero cost because it shares the mt76 dependency
chain with mt7925e.

## Install

### Pre-built packages (Fedora / Ubuntu)

Download `.rpm` or `.deb` from the
[latest release](https://github.com/jetm/mediatek-mt7927-dkms/releases/latest):

```bash
# Fedora / RPM-based
sudo dnf install ./mediatek-mt7927-dkms-*.rpm

# Ubuntu / Debian
sudo dpkg -i ./mediatek-mt7927-dkms_*.deb
```

### AUR (Arch Linux)

```bash
yay -S mediatek-mt7927-dkms
# or
paru -S mediatek-mt7927-dkms
```

### Build from source

Supports kernels 6.17+. Requires `dkms`, `make`, `gcc`, `python3`, `curl`,
and kernel headers.

```bash
git clone https://github.com/jetm/mediatek-mt7927-dkms.git
cd mediatek-mt7927-dkms
make download
make sources
sudo make install
sudo dkms add mediatek-mt7927/2.7
sudo dkms build mediatek-mt7927/2.7
sudo dkms install mediatek-mt7927/2.7
sudo modprobe -r mt7925e mt7921e btusb
sudo modprobe mt7925e btusb
```

You can also build packages locally:

```bash
# Fedora
sudo dnf install rpm-build
make rpm
sudo dnf install rpmbuild/RPMS/noarch/mediatek-mt7927-dkms-*.rpm

# Ubuntu / Debian
sudo apt install dpkg-dev
make deb
sudo dpkg -i mediatek-mt7927-dkms_*.deb
```

### Community ports

- **NixOS:** [cmspam/mt7927-nixos](https://github.com/cmspam/mt7927-nixos), [clemenscodes/linux-mt7927](https://github.com/clemenscodes/linux-mt7927)
- **Bazzite (Fedora Atomic):** [samutoljamo/bazzite-mt7927](https://github.com/samutoljamo/bazzite-mt7927)

## Post-install

Reload kernel modules to pick up new builds without rebooting:

```bash
sudo modprobe -r mt7925e mt7921e btusb
sudo modprobe mt7925e btusb
```

Or just reboot.

## Verification

Quick validation (<30 seconds, non-destructive):

```bash
./test-driver.sh              # auto-detect interface
./test-driver.sh wlp9s0       # specify interface
```

Long-running stability monitor (8 hours default):

```bash
./stability-test.sh                   # 8-hour test, auto-detect
./stability-test.sh -d 2h             # 2-hour test
./stability-test.sh -s 192.168.1.50   # with iperf3 server
```

## Troubleshooting

**5/6 GHz authentication retries:** WPA handshake may fail on the first attempt.
Configure NetworkManager to retry automatically:

```bash
nmcli connection modify <ssid> connection.auth-retries 3
```

**Bluetooth rfkill soft-block:** If Bluetooth appears blocked after reboot:

```bash
rfkill unblock bluetooth
```

**Bluetooth USB device disappeared:**

The MT6639 BT firmware can lock up during module reload or DKMS upgrade, causing the
USB device to vanish from `lsusb`. This persists across reboots and affects all OSes
(Linux and Windows). See [#23](https://github.com/jetm/mediatek-mt7927-dkms/issues/23).

Fix: shut down completely, unplug the PSU cable (or switch off at the back), wait at
least 10 seconds, then power back on. A CMOS reset also works but is more disruptive.

**DKMS not built for current kernel:**

```bash
sudo dkms install mediatek-mt7927/2.7
```

## Upstream tracking

| Submission | Status | Tracking |
|-----------|--------|----------|
| WiFi patches (linux-wireless@) | v2 under review, v3 in progress | [#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15) |
| BT driver patches (linux-bluetooth@) | v2 pending | [#16](https://github.com/jetm/mediatek-mt7927-dkms/issues/16) |
| BT firmware (linux-firmware) | MR open | [#17](https://github.com/jetm/mediatek-mt7927-dkms/issues/17) |

See [mt76#927](https://github.com/openwrt/mt76/issues/927) for the community tracking issue.

## Roadmap

### Upstream submission

Submit WiFi patches to linux-wireless@, BT driver patches to linux-bluetooth@,
and BT firmware to linux-firmware. Once merged, this package becomes unnecessary
for kernels that include MT7927 support.

- **WiFi** ([#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15)) -
  13-patch series on linux-wireless@, v2 under review, v3 addressing Sean Wang's feedback.
- **BT driver** ([#16](https://github.com/jetm/mediatek-mt7927-dkms/issues/16)) -
  8-patch series on linux-bluetooth@, v2 pending per reviewer feedback (split
  USB IDs into per-device commits, add Tested-by + lsusb/dmesg).
- **BT firmware** ([#17](https://github.com/jetm/mediatek-mt7927-dkms/issues/17)) -
  GitLab MR [!946](https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/946)
  on linux-firmware, pipeline passes, awaiting review.

### After the base series

These are planned as follow-up patches once the base series lands:

- **MLO (Multi-Link Operation)** ([#25](https://github.com/jetm/mediatek-mt7927-dkms/issues/25)) -
  Not included in the current package. Three targeted fixes (cfg80211 BSS flag
  relaxation, ROC timer extension, 5GHz/6GHz band exclusion) have been verified
  in development (STR dual-link, 5GHz+2.4GHz) but need more testing before
  shipping. If your router has MLO enabled, disable it to avoid disconnects.
- **mac_reset recovery** ([#28](https://github.com/jetm/mediatek-mt7927-dkms/issues/28)) -
  full DMA reinitialization on firmware crash. Has unguarded paths on
  mt7925 standalone that need fixing first.

### Firmware dependencies

These issues are firmware-controlled and cannot be fixed in the driver:

- **TX retransmissions** ([#26](https://github.com/jetm/mediatek-mt7927-dkms/issues/26)) -
  ~35% retry rate at 320MHz, firmware manages rate adaptation and retry logic
- **BT USB disappearance** ([#23](https://github.com/jetm/mediatek-mt7927-dkms/issues/23)) -
  MT6639 BT firmware locks up during module reload, requires full power cycle
  (PSU unplug). Affects Linux and Windows.
- **6GHz MLO link** - passive scan and ML probe limitations prevent 6GHz
  link discovery (cfg80211/wpa_supplicant limitation)

See [mt76#927](https://github.com/openwrt/mt76/issues/927) for detailed discussion.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for the full release history.

## AI attribution

The kernel patches (mt76 driver changes submitted to linux-wireless and
linux-bluetooth) are written by a human. The packaging scripts, test harness,
and documentation in this repository use AI assistance (Claude).

## License

GPL-2.0-only
