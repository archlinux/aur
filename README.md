
# AMDGPU Fan Curve

Custom fan curve script and systemd service for AMD RDNA3 GPUs.

## Description

`amdgpu-fan-curve` is a script that allows you to apply custom fan speed curves for AMD RDNA3 graphics cards by writing directly to the kernel's sysfs interface.

It supports multiple GPUs and lets you store and switch between different fan curve profiles.

## Installation

You can install the package from AUR or build it manually.

## Usage

Run the script with root privileges:

```bash
sudo amdgpu-fan-curve [profile_name]
```

- If `profile_name` is omitted, the default profile will be applied.
- Profiles are stored in `/var/fan_curves/` as files named `fan_curve_<profile_name>`.

## Service

A systemd service is provided to automatically apply the default fan curve on system startup:

```bash
sudo systemctl enable --now amdgpu-fan.service
```

## Permissions

The profile directory `/var/fan_curves` is owned by group `video`. Add your user to the `video` group to create or modify profiles:

```bash
sudo usermod -aG video your_username
```

## License

MIT License

## Maintainer

Fox-sys <berestovborisasz@gmail.com>
