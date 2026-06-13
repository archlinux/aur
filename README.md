# samsung-galaxybook-5g

Arch package for Samsung Galaxy Book 5G/LTE modem support and Omarchy Waybar integration.

It installs:

- `samsung-galaxybook-5g-status`: JSON status command for Waybar
- `samsung-galaxybook-5g`: fuzzel menu for enable/connect/disconnect
- `samsung-galaxybook-5gctl`: privileged helper used through `pkexec`
- `samsung-galaxybook-5g-setup-omarchy`: user-level helper to add the Waybar module
- ModemManager FCC unlock symlinks for `14c3:4d75` and `105b`

## Install locally

```sh
makepkg -si
sudo systemctl restart ModemManager
samsung-galaxybook-5g-setup-omarchy
```

The default APN is `fast.t-mobile.com`. To use another APN:

```sh
export SAMSUNG_GALAXYBOOK_5G_APN=your.apn
samsung-galaxybook-5g
```

## Waybar module

```jsonc
"custom/5g": {
  "exec": "samsung-galaxybook-5g-status",
  "return-type": "json",
  "interval": 5,
  "on-click": "samsung-galaxybook-5g",
  "tooltip": true
}
```
