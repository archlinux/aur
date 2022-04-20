# AMD OpenCL PAL for Arch Linux
This repository hosts an [Arch Linux](https://www.archlinux.org/)
[PKGBUILD](https://wiki.archlinux.org/index.php/PKGBUILD) for the
[AMD Non-free PAL OpenCL Platform](https://www.amd.com/en/support/kb/faq/amdgpu-installation).

## Installation
The Arch Linux packages for OpenCL PAL are available on the
[AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository).
Since many packages will be installed, it is recommended to use an
[AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers)
like [`paru`](https://aur.archlinux.org/packages/paru/).

To install OpenCL PAL, use
```bash
paru -S opencl-legacy-amdgpu-pro
```
And for 32-bit libraries, use
```bash
paru -S lib32-opencl-legacy-amdgpu-pro
```

.
