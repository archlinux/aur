# nvidia-open-egpu

Arch Linux packages for NVIDIA's open kernel modules with Thunderbolt eGPU hotplug support. The current package is based on NVIDIA open-gpu-kernel-modules 615.78.08; see `PKGBUILD` for the package release and `CHANGELOG.md` for recent changes.

The patch set adds guards for GPU surprise removal and reconnect cleanup. Udev loads the NVIDIA modules when an NVIDIA display GPU appears and starts eGPU cleanup when a Thunderbolt device is removed. Cleanup tracks NVIDIA-classified external GPUs by PCI address and device nodes, so it can target the GPU that disappeared without relying on device numbering.

Package patches are maintained in [bdandy/open-gpu-kernel-modules](https://github.com/bdandy/open-gpu-kernel-modules). The upstream source is [NVIDIA/open-gpu-kernel-modules](https://github.com/NVIDIA/open-gpu-kernel-modules).

## Packages

Choose one package:

- `nvidia-open-egpu`: modules built for Arch's `linux` kernel.
- `nvidia-open-egpu-dkms`: DKMS source for kernels with matching headers installed.

Both packages require NVIDIA userspace utilities at the same version as the modules or newer. The package dependencies enforce this.

## Installation

With an AUR helper, install one package:

```bash
yay -S nvidia-open-egpu
# or
paru -S nvidia-open-egpu-dkms
```

To build manually:

```bash
git clone https://aur.archlinux.org/nvidia-open-egpu.git
cd nvidia-open-egpu
makepkg -s
sudo pacman -U ./nvidia-open-egpu-[0-9]*.pkg.tar.zst
```

For the DKMS package, install its archive instead:

```bash
sudo pacman -U ./nvidia-open-egpu-dkms-[0-9]*.pkg.tar.zst
```

The DKMS package needs headers for each kernel you use. The prebuilt package targets Arch's `linux` kernel.

## Hotplug behavior and settings

On Thunderbolt removal, the handler waits for PCI removal and checks which recorded external NVIDIA GPU disappeared. Process termination and module unloading are both enabled by default and can be configured independently in `/etc/nvidia.env`:

```ini
# Leave applications using the removed eGPU running.
NVIDIA_EGPU_KILL_PROCESSES=0

# Keep NVIDIA modules loaded after eGPU removal.
NVIDIA_EGPU_UNLOAD_MODULES=0
```

When process termination is enabled, the handler sends `SIGTERM` to processes holding the removed eGPU's NVIDIA or DRM device nodes. After five seconds, it sends `SIGKILL` to remaining target-only processes. It leaves a process running if it also holds a device node for another active NVIDIA GPU. Module unloading is attempted only when no NVIDIA GPU remains; it retries up to three times.

For a Thunderbolt 4/5 enclosure the driver does not identify as external, force external mode for that eGPU's PCI address in `/etc/modprobe.d/nvidia-egpu.conf`:

```conf
options nvidia NVreg_RegistryDwordsPerDevice="pci=0000:04:00.0;RmForceExternalGpu=1"
```

Replace `0000:04:00.0` with the eGPU's PCI BDF. This per-device setting avoids forcing external mode on other NVIDIA GPUs.

For systems that need the ReBAR bridge workaround, set the sibling PCI-to-PCI bridge BDF in `/etc/nvidia.env`:

```ini
NVIDIA_EGPU_DISABLE_BRIDGE=0000:03:04.0
```

The handler temporarily removes that bridge around module loading and rescans PCI afterward. Use this only when the eGPU needs the workaround; the bridge's downstream devices are temporarily removed too.

The package's modprobe configuration blacklists NVIDIA and Nouveau aliases so the eGPU udev handler controls module loading. On a system with an internal NVIDIA GPU, review `/usr/lib/modprobe.d/nvidia-open.conf`; an `/etc/modprobe.d/nvidia-open.conf` override can replace it. Keep NVIDIA modules out of the initramfs on eGPU-only systems, and include them there only when needed for an internal NVIDIA GPU.

## License

MIT and GPL-2.0-only, matching the upstream open kernel modules.

Maintainer: Bohdan Dymchenko
