# droidcam-client-bin (Arch Linux)

Arch Linux package for the **official DroidCam desktop client** distributed by Dev47Apps.

This package repackages the official upstream Debian package for Arch Linux and adds native Arch integration for the DroidCam virtual camera.

⚠️ **This is a binary package.** The DroidCam application itself is proprietary and is not built from source.

---

## What this is

This package provides the **new official DroidCam desktop client**, distributed upstream by Dev47Apps as a Debian `.deb` package.

It includes:

- 📱 Official DroidCam desktop client
- 🖥️ Qt5-based graphical interface
- 🎥 DroidCam OBS integration
- 📷 Virtual camera support through `v4l2loopback`
- 🐧 Arch Linux packaging and filesystem integration
- 🌐 Wayland support
- ⚙️ Automatic virtual camera creation at boot
- 🔄 Automatic detection of the DroidCam version from the upstream package

The upstream application and its bundled runtime are installed under:

```text
/opt/droidcam-obs-client/
```

The main application launcher is:

```text
/usr/bin/droidcam
```

---

## Why this package exists

Dev47Apps officially distributes the current Linux DroidCam client as a Debian package.

Arch Linux users can extract and run the package manually, but that does not provide proper Arch package integration.

This package handles that integration while leaving the upstream DroidCam application itself untouched.

Specifically, it:

- Repackages the official `.deb` as an Arch package
- Moves the application launcher to `/usr/bin`
- Declares the required Arch dependencies
- Installs the DroidCam virtual camera helper
- Installs a systemd service for automatic camera creation
- Integrates `v4l2loopback-ctl`
- Preserves the bundled OBS Studio license
- Automatically determines the package version from the upstream Debian package

---

# Virtual Camera

The package uses `v4l2loopback` to provide a dedicated:

```text
DroidCam Virtual Camera
```

device.

The camera is created dynamically at boot using:

```text
v4l2loopback-ctl
```

The package installs the following helper:

```text
/opt/droidcam-obs-client/bin/64bit/droidcam-virtual-camera-helper
```

and the following systemd service:

```text
/usr/lib/systemd/system/droidcam-virtual-camera.service
```

The service checks whether a DroidCam virtual camera already exists.

If it does not exist, it creates one.

The `/dev/videoX` number is **not hard-coded**.

For example, the camera may appear as:

```text
/dev/video2
```

on one system and:

```text
/dev/video4
```

on another.

This is intentional.

---

## OBS Virtual Camera compatibility

The DroidCam virtual camera is created **separately** from OBS Virtual Camera.

For example:

```text
OBS Virtual Camera
    /dev/video10

DroidCam Virtual Camera
    /dev/video2
```

The package does **not** configure `v4l2loopback` to create the OBS camera.

OBS remains responsible for creating and managing its own:

```text
OBS Virtual Camera
```

This allows both virtual cameras to coexist.

⚠️ Do **not** add `OBS Virtual Camera` to the DroidCam configuration.

---

# Systemd Service

The DroidCam virtual camera service is:

```text
droidcam-virtual-camera.service
```

It is automatically enabled when the package is installed.

Check its status with:

```bash
systemctl status droidcam-virtual-camera.service
```

View its logs with:

```bash
journalctl -u droidcam-virtual-camera.service
```

The service is a `oneshot` service.

Therefore, this status is normal:

```text
Active: active (exited)
```

The service runs during boot, creates the camera, and exits successfully.

It does not need to remain running.

---

# Checking Video Devices

List all V4L2 devices:

```bash
v4l2-ctl --list-devices
```

List `v4l2loopback` devices:

```bash
sudo v4l2loopback-ctl list
```

Example:

```text
OUTPUT          CAPTURE         NAME
/dev/video10    /dev/video10    OBS Virtual Camera
/dev/video2     /dev/video2     DroidCam Virtual Camera
```

The actual `/dev/videoX` number is determined dynamically.

---

# Dependencies

The package requires:

- `qt5-base`
- `qt5-svg`
- `qt5-wayland`
- `curl`
- `libpulse`
- `pciutils`
- `speexdsp`
- `v4l2loopback-dkms`
- `v4l2loopback-utils`

The upstream DroidCam package contains its own OBS/FFmpeg runtime and related libraries.

These are intentionally kept inside:

```text
/opt/droidcam-obs-client/
```

rather than replaced with system libraries.

---

# Installation

## Build and Install Manually

Clone the repository:

```bash
git clone https://github.com/Dark-Witcher/new-droidcam-client-bin.git
```

Enter the directory:

```bash
cd new-droidcam-client-bin
```

Build and install:

```bash
makepkg -si
```

`makepkg` will:

1. Download the official DroidCam Debian package.
2. Extract the upstream application.
3. Repackage it as an Arch package.
4. Install the Arch-specific integration.
5. Enable the DroidCam virtual camera service.

---

## AUR

Once published to the AUR, the package can be installed with an AUR helper such as:

```bash
paru -S droidcam-client-bin
```

or:

```bash
yay -S droidcam-client-bin
```

---

# Version Handling

The PKGBUILD extracts the DroidCam version directly from the upstream Debian package.

The version is read from:

```text
control.tar.xz
```

and its:

```text
Version:
```

field.

This means the PKGBUILD does not need to be manually edited just because Dev47Apps releases a new DroidCam version.

The upstream download URL remains:

```text
https://droidcam.app/go/droidCam.client.setup.deb
```

The package version is determined automatically when `makepkg` runs.

⚠️ This does **not** automatically update an installed package.

A new package still needs to be built and published when a new upstream release becomes available.

---

## Updating

### From the Git repository

To rebuild the package with the latest upstream DroidCam release:

```bash
makepkg -Cfsi

---
# Uninstallation

Remove the package normally with:

```bash
sudo pacman -Rns droidcam-client-bin
```

The package's uninstall hook disables the DroidCam virtual camera service.

The `v4l2loopback` packages are not removed automatically because they are separate dependencies and may be used by other applications.

---

# What this is NOT

- ❌ Not the legacy DroidCam Linux client
- ❌ Not `droidcam-obs`
- ❌ Not OBS Studio
- ❌ Not an open-source implementation
- ❌ Not built from source
- ❌ Not a reverse-engineered DroidCam implementation
- ❌ Not an alternative DroidCam protocol implementation
- ❌ Not a modified build of the DroidCam application

The actual DroidCam client is the official binary distributed by Dev47Apps.

---

# Security and Packaging

This package does not compile or modify the proprietary DroidCam application.

The upstream application is extracted from the official Dev47Apps Debian package.

The Arch-specific modifications are limited to:

- Filesystem layout
- Launcher path
- Package metadata
- Dependency declaration
- Virtual camera integration
- Systemd integration
- License installation

The bundled proprietary application remains unchanged.

---

# Licenses

**DroidCam**

Proprietary software distributed by Dev47Apps.

See:

https://www.dev47apps.com/

**OBS Studio**

The upstream DroidCam package contains components from OBS Studio.

The bundled OBS Studio GPLv2 license is preserved and installed at:

```text
/usr/share/licenses/droidcam-client-bin/gplv2.txt
```

The DroidCam package license is installed at:

```text
/usr/share/licenses/droidcam-client-bin/LICENSE
```

---

# Maintainer

**Dark Witcher**

GitHub:

https://github.com/Dark-Witcher/

---

# Upstream

**Dev47Apps**

https://www.dev47apps.com/

**DroidCam**

https://droidcam.app/
