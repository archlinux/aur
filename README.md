# libcamera-ipu7-ov08x40

Arch `makepkg` project for Intel IPU7 laptops with an OmniVision OV08X40
camera. It replaces the stock `libcamera` and `libcamera-ipa` packages.

## What This Fixes

- Avoids the broken OV08X40 1928x1088 binned mode, which returns buffers that
  are almost entirely `0xffff` on IPU7 and produces white browser video.
- Forces native 3856x2176 sensor capture before GPU SoftISP scaling.
- Hardens CPU SoftISP against invalid high bits in unpacked 10/12-bit input.
- Pins GPU SoftISP to the Intel Mesa EGL implementation instead of a discrete
  NVIDIA GPU.
- Hides raw IPU7 V4L2 nodes while exposing the processed libcamera source.
- Loads the required `intel_cvs` module at boot.
- Provides an on-demand V4L2 compatibility camera for enterprise Chromium
  builds that disable PipeWire camera support.
- Restores the direct OV08X40 media topology on Linux 7.2 through a patched
  DKMS replacement for the modular IPU bridge.

The package provides `libcamera`, `libcamera-ipa`, `libcamera.so`, and
`libcamera-base.so`, so existing PipeWire and application dependencies remain
satisfied.

## Requirements

- Intel IPU7 (`8086:b05d` tested)
- OV08X40 / ACPI `OVTI08F4`
- `dkms` and kernel headers for each installed kernel
- `pipewire-libcamera` for browser integration
- `v4l2loopback-dkms` for V4L2-only browsers

## Pinned Sources

- libcamera: `191e202178f02430b5942397c70d215cdd2056fa` (`v0.7.2`)
- Intel vision drivers: `845d6f8bdf66ff1f455901da9de5e00a53a83dce`

The repository intentionally does not follow mutable branches or tags. Update
these commits and rebuild deliberately when testing newer dependencies.

## Linux 7.2 Compatibility

The `ipu-bridge-legacy-cvs-dkms` split package rebuilds only the patched
`ipu-bridge.ko` module for Linux 7.2 kernels. It installs through DKMS ahead of
the in-tree module, avoiding a custom full-kernel build while preserving the
external Intel CVS ownership driver used by this camera stack. The package uses
DKMS's force-install registry because it intentionally replaces an unversioned
in-tree module.

The package requires `linux>=7.2`, `linux<7.3`, and matching `linux-headers`.
These constraints intentionally block an incompatible kernel upgrade until the
bridge override has been updated and tested for the next kernel series.

The complete tested platform is:

- `linux` and `linux-headers`: `>=7.2` and `<7.3`
- `wireplumber` and `libwireplumber`: `0.5.15`

Pacman reports the Linux constraints directly if dependency resolution fails.
WirePlumber remains optional so the V4L2 relay can be installed without a
PipeWire camera session manager, but versions 0.5.16 and 0.5.17 are known not
to export this camera correctly. Pacman displays the tested WirePlumber version
as an unsatisfied optional dependency when another version is installed.

## Licensing

Repository-authored packaging, documentation, and configuration use MIT.
Patches retain the upstream code license: LGPL-2.1-or-later for libcamera and
GPL-2.0-only for v4l2-relayd. See `LICENSE`, `REUSE.toml`, and `LICENSES/`.

## Build And Install

```bash
makepkg -si
systemctl --user daemon-reload
systemctl --user restart wireplumber.service
sudo systemctl enable --now v4l2-relayd-ipu7.service
```

## Install From The AUR

For the complete stack, including the V4L2 compatibility camera used by
Chromium-based browsers:

```bash
paru -S v4l2-relayd-ipu7-ov08x40
```

For native libcamera and PipeWire camera support only:

```bash
paru -S libcamera-ipu7-ov08x40
```

Do not install the IPA or DKMS split packages directly. They are internal
dependencies and are installed automatically by either user-facing package.

## Verification

After restarting WirePlumber, `wpctl status` should show one libcamera source:

```text
Video
 |-- Devices:
 |    ov08x40 [libcamera]
 |-- Sources:
      Built-in Front Camera
```

Firefox can use the native PipeWire source. Prisma Access Browser and other
V4L2-only applications can use `Prisma Compatibility Camera`. The relay keeps
the physical sensor closed until a capture client opens `/dev/video90`, then
releases it when the last client closes.

## Files

- `PKGBUILD`: split Arch package build definition.
- `libcamera-ipu7-ov08x40.patch`: libcamera mode-selection and input hardening.
- `libcamera-configuration.yaml`: keeps standalone tools on CPU SoftISP.
- `wireplumber-disable-ipu7-v4l2.conf`: hides raw ISYS capture nodes.
- `wireplumber-libcamera-gpu.conf`: enables GPU SoftISP and pins EGL to Mesa Intel for browsers.
- `libcamera-ipu7-ov08x40.modules-load.conf`: loads `intel_cvs` at boot.
- `v4l2-relayd-cleanup.patch`: fixes relay cleanup and error diagnostics.
- `v4l2-relayd-ipu7.service`: exposes an on-demand 640x480 I420 camera.
- `v4l2loopback-ipu7.conf`: creates the Chromium-compatible loopback device.
- `ipu7-legacy-cvs.patch`: restores the direct sensor-to-IPU media topology.
- `ipu-bridge-dkms.conf`: limits the bridge override to Linux 7.2 kernels.
