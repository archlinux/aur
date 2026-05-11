# obs-bilibili-stream AUR Package

This folder contains the AUR package files for `obs-bilibili-stream`.

## How to install

1.  Make sure you have `base-devel` and `git` installed.
2.  Clone this repository or copy these files to a new directory.
3.  Run `makepkg -si` to build and install the package.

```bash
cd obs-bilibili-stream-aur
makepkg -si
```

## Description

A Bilibili stream plugin for OBS Studio.
- Scan QR code to login.
- Update room information.
- Get RTMP push address and stream key.

## Dependencies

- `obs-studio`
- `curl`
- `qt6-base`
- `cmake` (build-time)
- `ninja` (build-time)
