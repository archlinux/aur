# kvmfr-dkms

Standalone DKMS packaging for the KVMFR kernel module from [Looking Glass](https://github.com/gnif/LookingGlass).

The package contains the upstream `module/` sources under `/usr/src/kvmfr-0.0.12`. DKMS builds the module for installed kernels when their matching headers are available. Install the header package for each kernel you use; for example, `linux-cachyos-headers` for CachyOS kernels.

The package only manages the module source and DKMS integration. Loading the module, setting `static_size_mb`, device permissions, and VM configuration remain system-specific.

## Build

```sh
makepkg -si
```

## Existing manual installation

The B7 source files installed manually under `/usr/src/kvmfr-0.0.12` are byte-for-byte identical to this package's sources. To let pacman adopt those existing paths, install with an overwrite rule scoped to that directory, for example:

```sh
paru -S kvmfr-dkms --overwrite '/usr/src/kvmfr-0.0.12/*'
```

Do not install this package alongside `looking-glass-module-dkms`, `looking-glass-module-dkms-git`, or `looking-glass-rc-module-dkms`; each registers the same `kvmfr` DKMS module.
