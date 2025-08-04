# brcmfmac-suspend

A simple systemd workaround to improve suspend/resume reliability for Broadcom WiFi devices using the `brcmfmac` kernel module.

## ❓ Why

On some systems (notably the MacBookPro12,1), the Broadcom WiFi driver `brcmfmac` causes suspend failures, typically with errors like:

```
brcmfmac 0000:03:00.0: PM: pci_pm_suspend(): brcmf_pcie_pm_enter_D3 [brcmfmac] returns -5
```

This results in:

```
PM: Some devices failed to suspend, or early wake event detected
```

and the suspend process failing entirely.

## 🛠 How it works

This package installs a systemd service (`brcmfmac-suspend.service`) that:

- **Unloads** the `brcmfmac` module before suspend
- **Reloads** it after resume (with a short delay to avoid race conditions)

It’s designed to run *after* `NetworkManager.service` is stopped and *before* the system actually suspends.

## ⚙️ Tweaking

If the workaround fails on your system:

- Increase the delay (`sleep 2`) in the service script (`/etc/systemd/system/sleep.target.wants/brcmfmac-suspend.service`) to allow more time for interfaces to go down
- As a last resort, manually disable WiFi before suspending (in Gnome settings or with `nmcli radion off`)

To manually test suspend:

```bash
systemctl suspend
```

## 📚 Related resources

- Arch Wiki: [Broadcom wireless](https://wiki.archlinux.org/title/Broadcom_wireless)
- Kernel logs: use `journalctl -b -e` to see suspend/resume activity

## 🧪 Tested on

- MacBookPro12,1
- Linux 6.5+
- `brcmfmac` (from `linux-firmware` package)

---

### 💬 Feedback

Suggestions, patches, and discussion welcome. If this package helps you — or doesn’t — feel free to comment on the AUR page.
