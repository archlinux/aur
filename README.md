# Javier Tia

Senior Systems Engineer - Linux Kernel · Security · Yocto · CI/CD

🌍 Costa Rica - Remote
📬 javier@jetm.me
🔗 [LinkedIn](https://cr.linkedin.com/in/javiertia) · [Blog](https://jetm.github.io/blog)

**Currently available for new opportunities** - freelance or full-time, fully remote.

---

# mediatek-mt7927-dkms

DKMS driver for MediaTek MT7927 (Filogic 380) - WiFi 7 + Bluetooth 5.4 on Linux.

Builds out-of-tree btusb/btmtk (Bluetooth) and mt76 (WiFi) kernel modules with
device ID and firmware patches not yet in mainline. Supports kernels 6.17+.

> **Maintenance notice:** This project is actively maintained. Response times
> may be delayed - my current focus is on other projects that can give me a
> steady income so I can continue giving my best here. Patches are being
> submitted upstream; once merged, this package will be archived. Sponsorship
> does not make sense for a project with a planned end date - if you want to
> help, pass my CV to someone with hiring power: https://jetm.github.io/blog/cv/

## Status

| Component | Status | Details |
|-----------|--------|---------|
| Bluetooth (MT6639 via USB) | **WORKING** | Patched btusb with device ID + firmware |
| WiFi (MT7925e via PCIe) | **WORKING** | 2.4/5/6 GHz, 320MHz EHT, suspend/resume |

**Known issues:**
- TX retransmissions can be elevated (~35% at 320 MHz, firmware-side) depending on which firmware build you run. Since v2.14-4 the WiFi firmware comes from linux-firmware rather than from this package; see "WiFi firmware" below. EHT path overhead also limits upload throughput - disable with `disable_eht=1` in wpa_supplicant for a ~2x upload improvement at 160 MHz. ([#26](https://github.com/jetm/mediatek-mt7927-dkms/issues/26))
- Bluetooth USB device may disappear after module reload or DKMS upgrade, persists
  across reboots. The MT6639 BT firmware locks up, and a normal reboot does not clear
  it because the controller keeps standby power. Preferred fix: enable **ErP** in the
  BIOS (on ASUS boards it lives with the APM/power settings; pick the option that
  covers a normal shutdown, usually labelled S4+S5). That cuts the standby rail, so
  the controller cold-initialises on the next power-on and you set it once rather
  than repeating a drain. The trade-off is that USB ports stay unpowered while the
  machine is off, so nothing charges on standby. Otherwise: shut down, switch the PSU
  off at the back or unplug it, wait 10 seconds, then power back on. ErP tip from
  spikesolobb. ([#23](https://github.com/jetm/mediatek-mt7927-dkms/issues/23))
- AP mode throughput at 80 MHz varies with RF conditions (~295-570 Mbps; up to 570 Mbps in quiet RF, ~422 Mbps in congested 5 GHz environments) vs ~700 Mbps on Windows. NetworkManager defaults to 20 MHz which drops to ~130 Mbps - use hostapd for wider channels. AP at 320 MHz on 6 GHz with Wi-Fi 7 clients (Intel BE200) is range-dependent: ~1.96 Gbps at 1 m (0 retries), ~770 Mbps at typical room distance, rate-control collapse to 6 Mbit/s under poor RF or extended range. ([#36](https://github.com/jetm/mediatek-mt7927-dkms/issues/36))

## Supported hardware

| Device | BT USB ID | WiFi PCI ID |
|--------|-----------|-------------|
| ASUS ROG Crosshair X870E Hero | 0489:e13a | 14c3:7927 |
| ASUS ROG Crosshair X870E Hero (MT6639 variant) | 13d3:3588 | 14c3:6639 |
| ASUS ROG Crosshair X870E Dark Hero | 0489:e13a | 14c3:7927 |
| ASUS ROG Crosshair X870E Glacial | 0489:e13a | 14c3:7927 |
| ASUS ROG Crosshair X870E Extreme | 13d3:3588 | 14c3:6639 |
| ASUS ProArt X870E-Creator WiFi (rev 1, MT6639) | 13d3:3588 | 14c3:6639 |
| ASUS ProArt X870E-Creator WiFi (rev 2, MT7927) | 0489:e13a | 14c3:7927 |
| ASUS ROG Strix X870-I | 0489:e13a | 14c3:7927 |
| ASUS ROG Strix X870E-E | 13d3:3588 | 14c3:7927 |
| ASUS ROG STRIX B850-E GAMING WIFI | 0489:e13a | 14c3:7927 |
| Gigabyte X870E Aorus Master X3D | 0489:e10f | 14c3:7927 |
| Gigabyte Z790 AORUS MASTER X | 0489:e10f | 14c3:7927 |
| Gigabyte Z790 AORUS ELITE X WiFi7 | 0489:e10f | 14c3:7927 |
| Gigabyte X870E Aero X3D Dark Wood | 0489:e10f | 14c3:7927 |
| MSI MEG X870E ACE MAX | 0489:e110 | 14c3:7927 |
| MSI PRO X870E-P WIFI (MS-7E70) | 0489:e110 | 14c3:7927 |
| Lenovo Legion Pro 7 16ARX9 | 0489:e0fa | 14c3:7927 |
| Lenovo Legion Pro 7 16AFR10H | 0489:e0fa | 14c3:7927 |
| TP-Link Archer TBE550E PCIe | 0489:e116 | 14c3:7927 |
| EDUP EP-MT7927BE M.2 | - | 14c3:7927 |
| Foxconn/Azurewave M.2 modules | - | 14c3:6639 |
| AMD RZ738 (MediaTek MT7927) | - | 14c3:0738 |

Check if your hardware is detected:

```bash
lspci -nn | grep -i 14c3      # WiFi (PCIe)
lsusb | grep -iE '0489|13d3|0e8d'  # Bluetooth (USB)
```

## Tested distributions

Requires kernel 6.17+ and DKMS.

| Distribution | Kernel | Install method |
|-------------|--------|----------------|
| Arch Linux / CachyOS | 6.19+ | AUR (`yay -S mediatek-mt7927-dkms`) |
| Fedora 44 | 6.17+ | RPM (`make rpm`) |
| Ubuntu 26.04 | 7.0+ | `make install` or `make deb` |
| Ubuntu 24.04 / Debian | 6.17+ | DEB (`make deb`) |
| Proxmox VE | 6.17+ | `make install` |
| NixOS | 6.17+ | [Community port](https://github.com/cmspam/mt7927-nixos) |
| Bazzite (Fedora Atomic) | 6.17+ | [Container image](https://github.com/samutoljamo/bazzite-mt7927) |
| Artix Linux | 6.18+ | `make install` |
| Linux Mint 22.2 (Ubuntu 24.04) | 6.17+ | `make install` |

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
chain with mt7925e. Bluetooth support for MT7902 (USB ID 13d3:3579, hw_variant 0x7902)
was added in v2.12.

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
sudo dkms add mediatek-mt7927/2.14
sudo dkms build mediatek-mt7927/2.14
sudo dkms install mediatek-mt7927/2.14
sudo modprobe -r mt7925e mt7921e btusb
sudo modprobe mt7925e
sudo modprobe btusb
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
sudo modprobe mt7925e
sudo modprobe btusb
```

Or just reboot.

## Verification

Quick validation (<30 seconds, non-destructive). Requires root:

```bash
sudo ./test-driver.sh              # auto-detect interface
sudo ./test-driver.sh wlp9s0       # specify interface
```

Long-running stability monitor (8 hours default):

```bash
sudo ./stability-test.sh                   # 8-hour test, auto-detect
sudo ./stability-test.sh -d 2h             # 2-hour test
sudo ./stability-test.sh -s 192.168.1.50   # with iperf3 server
```

## Troubleshooting

**`modprobe: ERROR: could not insert 'mt7925e': Key was rejected by service` (Secure Boot):**

Secure Boot is enabled and `mt7925e` is not signed with a key trusted by the firmware.
Fix: sign modules automatically via DKMS with a Machine Owner Key (MOK) — this keeps
Secure Boot enabled and re-signs on every kernel upgrade.

**Step 1 — Check for an existing DKMS key** (Ubuntu 20.04+ may already have one):

```bash
ls /var/lib/dkms/mok.key /var/lib/dkms/mok.pub 2>/dev/null
```

If both files exist, skip to Step 3.

**Step 2 — Generate a MOK signing key:**

```bash
sudo mkdir -p /var/lib/dkms

sudo openssl req -new -x509 -newkey rsa:2048 \
  -keyout /var/lib/dkms/mok.key \
  -out /var/lib/dkms/mok.pub \
  -days 36500 \
  -subj "/CN=DKMS module signing key/" \
  -nodes

sudo chmod 600 /var/lib/dkms/mok.key
```

**Step 3 — Enroll the key with Secure Boot:**

```bash
sudo mokutil --import /var/lib/dkms/mok.pub
# You will be prompted to set a one-time password — remember it for the next boot
sudo reboot
```

On reboot, the MokManager screen (blue UI) will appear: select **Enroll MOK** →
**Continue** → **Yes** → enter the one-time password → **Reboot**.

**Step 4 — Configure DKMS to auto-sign (non-Ubuntu distros):**

> **Ubuntu users:** DKMS automatically uses `/var/lib/dkms/mok.key` and
> `/var/lib/dkms/mok.pub` — skip this step.

For other distros, add signing configuration to `/etc/dkms/framework.conf`:

```bash
sudo tee -a /etc/dkms/framework.conf << 'EOF'
sign_tool="/etc/dkms/sign_helper.sh"
EOF
```

Then create the sign helper script:

```bash
sudo tee /etc/dkms/sign_helper.sh << 'EOF'
#!/bin/sh
/usr/lib/linux-kbuild-$(uname -r | cut -d- -f1)/scripts/sign-file \
  sha256 \
  /var/lib/dkms/mok.key \
  /var/lib/dkms/mok.pub \
  "$@"
EOF

sudo chmod +x /etc/dkms/sign_helper.sh
```

**Step 5 — Rebuild the module and verify:**

```bash
sudo dkms autoinstall
sudo modinfo mt7925e | grep -i signer
sudo modprobe mt7925e
mokutil --list-enrolled | grep -i dkms
```

If `modprobe` succeeds without errors, the fix is complete.

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
sudo dkms install mediatek-mt7927/2.14
```

**DKMS modules installed but not visible in `/usr/src/`:**

Built modules live in `/lib/modules/$(uname -r)/updates/dkms/`, not in `/usr/src/`.
The `/usr/src/mediatek-mt7927-<ver>/` directory holds unpatched source - DKMS applies
patches at build time. Verify a successful build with:

```bash
modinfo -F alias /lib/modules/$(uname -r)/updates/dkms/btusb.ko | grep -c 13d3:3579
dkms status
```

**EHT path overhead (low upload throughput at 160 MHz):**

If upload throughput is unexpectedly low at 160 MHz with EHT-capable clients, the EHT
data path in the current firmware adds overhead that roughly halves upload. PHY rate
barely changes (2401 → 2161 Mbit/s at 160 MHz) but upload doubles without EHT.
Add to your wpa_supplicant config or dispatcher:

```text
disable_eht=1
```

This is a firmware-side issue tracked in [#26](https://github.com/jetm/mediatek-mt7927-dkms/issues/26).

**Firmware upgrade and rollback:**

A systemd oneshot timer provides safe firmware testing. Before each upgrade:

1. Back up `/lib/firmware/mediatek/mt7927/` to a local path.
2. Create a oneshot systemd unit with `OnBootSec=8min` that restores the backup and
   reboots if not cancelled.
3. Boot with new firmware. If Wi-Fi associates, cancel the timer. If not, the machine
   self-recovers without console access.

## Upstream tracking

| Submission | Status | Tracking |
|-----------|--------|----------|
| WiFi driver (mt76/mt7925) | **Merged in mainline 7.2** (Sean Wang's MT7927 series) | [#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15) |
| BT driver (btusb/btmtk) | **Merged** (MT6639 native since 7.1) | [#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15) |
| WiFi firmware (linux-firmware) | **Merged** (MR !1055) | [#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15) |
| BT firmware (linux-firmware) | Needs a MediaTek-submitted MR (!946 closed) | [#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15) |

See [mt76#927](https://github.com/openwrt/mt76/issues/927) for the community tracking issue.

## Roadmap

### Upstream submission

The driver work is done. MT7927 WiFi and Bluetooth are both in mainline, so on a
7.2 or newer kernel this package is only needed for the AP-mode patches that have
not been submitted yet, and for the one Bluetooth device ID still pending.

- **WiFi** ([#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15)) -
  merged in mainline 7.2 via Sean Wang's MT7927 (Filogic 380) series, which
  folded in the 320MHz EHT, chip ID, firmware-path and IRQ-map patches from this
  package. Only 4 AP-mode patches remain out of tree.
- **BT driver** ([#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15)) -
  merged; MT6639 has been native since kernel 7.1. The package now carries a
  single device ID (0489:e156) that is not upstream yet.
- **WiFi firmware** ([#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15)) -
  merged into linux-firmware as MR
  [!1055](https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1055).
- **BT firmware** ([#15](https://github.com/jetm/mediatek-mt7927-dkms/issues/15)) -
  still shipped by this package. MR
  [!946](https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/946)
  was closed: linux-firmware takes vendor blobs from the copyright holder, so it
  needs a MediaTek-submitted MR rather than one from this project.

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

### WiFi firmware

Since v2.14-4 this package does **not** install the MT7927 WiFi firmware. MediaTek's
own build is in linux-firmware (merged as MR !1055), and the kernel's firmware loader
tries the uncompressed name before the `.zst` one, so a copy installed here silently
shadowed the newer vendor blob. Get the WiFi firmware from your distro's
`linux-firmware` package instead.

If your linux-firmware predates that merge, extract the blobs from the vendor ZIP by
hand:

```bash
make download                      # fetches the ASUS driver ZIP
python3 extract_firmware.py DRV_WiFi_MTK_*.zip /usr/lib/firmware/mediatek/mt7927/
```

The Bluetooth blob (`BT_RAM_CODE_MT6639_2_1_hdr.bin`) is still installed by this
package, and has to be: linux-firmware only accepts vendor blobs from the copyright
holder, so MR !946 was closed and MT6639 BT firmware has to be submitted by MediaTek
before it can live there.

### Firmware dependencies

These issues are firmware-controlled and cannot be fixed in the driver:

- **TX retransmissions** ([#26](https://github.com/jetm/mediatek-mt7927-dkms/issues/26)) -
  TX retry runs at ~35% at 320 MHz on some firmware builds. EHT path overhead halves
  upload throughput at 160 MHz - disable with `disable_eht=1` (see Troubleshooting).
  Newer is not reliably better on this chip: the ASUS 5.7.0.5659 build fails the
  WPA3-SAE handshake against some UniFi APs ([#102](https://github.com/jetm/mediatek-mt7927-dkms/issues/102)).
  Try the linux-firmware build first and only hunt for another if it misbehaves.
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
