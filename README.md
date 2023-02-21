# kernel-modules-hook

This is an alpm hook for Archlinux (or other pacman-based distribution) to keep the kernel modules of the running kernel available during a kernel upgrade.

It relies on hardlinks and bind mount for saving and restoring, and systemd-tmpfiles for cleanup.

## Installation

### Archlinux
[AUR](https://aur.archlinux.org/packages/kernel-modules-hook-hardlinks/)

Use your AUR helper of choise, or use makepkg.
