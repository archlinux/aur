# yubihsm-connector (AUR)

Arch Linux packaging for [yubihsm-connector](https://github.com/Yubico/yubihsm-connector),
the HTTP bridge between a YubiHSM 2 USB device and applications.

AUR page: https://aur.archlinux.org/packages/yubihsm-connector

## Build

```sh
makepkg -si
```

## Usage

```sh
sudo systemctl enable --now yubihsm-connector
curl http://127.0.0.1:12345/connector/status
```

Configuration lives in `/etc/yubihsm-connector.yaml`. The service runs as the
dedicated `yubihsm-connector` system user (created via sysusers.d); the bundled
udev rule grants that user access to the YubiHSM 2 USB device.

Note: for local-only use you may not need the connector at all. yubihsm-shell
and the PKCS#11 module can talk to the device directly over USB with the
`yhusb://` connector URL.

## Updating

1. Bump `pkgver` in `PKGBUILD`, reset `pkgrel` to 1
2. `makepkg -g` and update `sha256sums`
3. `makepkg -f` to test the build
4. `makepkg --printsrcinfo > .SRCINFO`
5. Commit and push to AUR and GitHub
