# `swayfx-nvidia`

Helper files to make swayfx a better experience for us poor NVIDIA users.

## Installation

### Dependencies

`swayfx` and any proprietary NVIDIA driver is required (although this probably includes their new open kernel modules, I have not tested). It may also be the case that `vulkan-validation-layers` are required to use the vulkan backend.

### AUR Installation

If you're using ArchLinux, the package is available in the AUR as [`swayfx-nvidia`](https://aur.archlinux.org/packages/swayfx-nvidia).

If you want to install this on another distro, you can clone and install the files manually

### From Source

SwayFX is still required if you're installing. This package doesn't replace it.

```sh
git clone https://github.com/meeplabsdev/swayfx-nvidia
sudo install -Dm755 swayfx-nvidia/swayfx-nvidia.sh "/usr/local/bin/swayfx-nvidia"
sudo install -Dm644 swayfx-nvidia/swayfx-nvidia.desktop "/usr/share/wayland-sessions/swayfx-nvidia.desktop"
sudo install -Dm644 swayfx-nvidia/wlroots-env-nvidia.sh "/usr/local/share/wlroots-nvidia/wlroots-env-nvidia.sh"
```

## Usage

### From TTY / Shell

If starting from a shell, replace your `sway` command with the following:

```sh
exec swayfx-nvidia
```
### From a Display Manager

If you're starting from a display manager, select `SwayFX (NVIDIA)` from your wayland sessions list

## Known Issues

### glxtest for Firefox hardware acceleration fails

This issue is being tracked [here](https://bugzilla.mozilla.org/show_bug.cgi?id=1759315)

## See Also

[A discussion on the NVIDIA forums for everyone sharing hacks to getting sway to work](https://forums.developer.nvidia.com/t/nvidia-495-on-sway-tutorial-questions-arch-based-distros/192212). If this package doesn't work on your PC, it's a good idea to see if anyone over there has a similar setup
