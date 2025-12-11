# nvidia-open-egpu

NVIDIA open kernel modules for Linux with external GPU (eGPU) hotplug support.

This is a patched version of the official NVIDIA open-gpu-kernel-modules that adds support for safe hot-unplug of external GPUs (eGPU) connected via Thunderbolt without kernel crashes.

## Source Code

This package patches are maintained at: https://github.com/bdandy/open-gpu-kernel-modules

The upstream NVIDIA source is available at: https://github.com/NVIDIA/open-gpu-kernel-modules

## What's Included

- Full NVIDIA open kernel module source
- Thunderbolt eGPU hotplug fixes (prevents kernel crashes on hot-unplug)
- GPU lost detection for external GPUs
- Proper surprise removal handling
- Stale device cleanup for reconnection
- Suppressed noisy error messages for expected removal

## Features

✅ No kernel crash when Thunderbolt eGPU is hot-unplugged
✅ Proper cleanup and recovery on reconnection
✅ Works with safe removal (e.g., `nvoff` script)
✅ Compatible with NVIDIA utils 580.105.08+

## Installation

```bash
git clone https://aur.archlinux.org/nvidia-open-egpu.git
cd nvidia-open-egpu
makepkg -si
```

Or using an AUR helper:

```bash
yay -S nvidia-open-egpu
# or
paru -S nvidia-open-egpu
```

## Usage

Choose one of the two packages:

- **nvidia-open-egpu**: Pre-compiled modules (recommended)
- **nvidia-open-egpu-dkms**: DKMS modules (auto-recompiles after kernel updates)

## Requirements

- Linux kernel headers matching your running kernel
- NVIDIA utilities version 580.105.08 or higher
- GCC compiler for module compilation

## Known Issues

- Only tested with Thunderbolt eGPUs (should work with other hotplug scenarios)
- Requires linux-headers package installed

## Based On

- NVIDIA open-gpu-kernel-modules 580.105.08
- Original AUR package by Daniel Bermond
- Patches maintained at: https://github.com/bdandy/open-gpu-kernel-modules

## Maintainer

Bohdan Dymchenko <dmbohdan@gmail.com>

## License

MIT and GPL-2.0-only (same as NVIDIA's open-gpu-kernel-modules)
