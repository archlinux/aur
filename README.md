# kernel-modules-hook

Forked from https://github.com/VannTen/kernel-modules-hook-hardlinks, including several bug fixes.  

This is an alpm hook for Archlinux (or other pacman-based distribution) to keep the kernel modules of the running kernel available during a kernel upgrade.

It relies on hardlinks and bind mount for saving and restoring, and systemd-tmpfiles for cleanup.

## Installation

### Archlinux
[AUR](https://aur.archlinux.org/packages/kernel-modules-hook-bindmount/)

Use your AUR helper of choise, or use makepkg.
