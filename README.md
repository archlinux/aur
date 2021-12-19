# Nvidia vGPU-Merged Packages for Arch Linux
Use Nvidia vGPU _and_ GeForce functions of consumer-grade NVIDIA GPUs.

This repository contains scripts for building all components of the "merged" driver package into drop-in replacements for the Arch Linux NVIDIA packages. It adds the following additional functions by means of scripts/drop-ins:
 - Wrapper for `nvidia-smi` to support recognizing consumer GPUs as vGPU-capable
 - Dependency re-ordering to ensure `libvirtd`, if installed, will start _after_ the NVIDIA vGPU services.

Compatible Linux Versions:
- Various 5.11 or older releases
- 5.12
- 5.14 except for some of the earlier 5.14 releases
- 5.15

## Important
These packages are not guaranteed to work out of the box (or at all), so use it at your own risk. Backups should be taken before attempting to replace stock NVIDIA drivers on any system.

## Installation
1. Build and install desired packages
2. Edit `/etc/vgpu_unlock/profile_override.toml` and set desired overrides.
3. Enable `nvidia-vgpu-mgr.service` and `nvidia-vgpud.service`
4. Reboot.

It is recommended to at least install `nvidia-merged` and `nvidia-merged-settings`, which will include the required services/kernel module sources by dependency.

## Credits
This project would not be possible without all those who came before me that wrote the software and figured out how to implement it:
 - [DualCoder - vgpu_unlock](https://github.com/DualCoder/vgpu_unlock)
 - [rupansh - twelve.patch](https://github.com/rupansh/vgpu_unlock_5.12)
 - [HiFiPhile - cvgpu.c](https://gist.github.com/HiFiPhile/b3267ce1e93f15642ce3943db6e60776/)
 - [Krutav Shah - vGPU_Unlock Wiki](https://docs.google.com/document/d/1pzrWJ9h-zANCtyqRgS7Vzla0Y8Ea2-5z2HEi4X75d2Q)
 - [tuh8888 - libvirt_win10_vm](https://github.com/tuh8888/libvirt_win10_vm)
 - [mbilker - vgpu_unlock-rs](https://github.com/mbilker/vgpu_unlock-rs)
