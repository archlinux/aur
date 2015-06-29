# mkinitcpio-growrootfs

This package was inspired (and borrows a lot of code from) the Debian package
`cloud-initramfs-growroot`. The idea is for a cloud image (AMI, QCOW2, etc) to
detect the size of the underlying block device, resize the root partition to
fill it, and then resize the root filesystem. This clearly needs to happen
before the root filesystem is mounted, so it's necessary to do it in a
`mkinitcpio` hook.

# Usage

## Testing on an existing, unresized cloud image

Install from the AUR, and add `grow` to your HOOKS list in
`/etc/mkinicpio.conf`. It depends on the `fsck` binary from the `fsck` hook,
but can be placed before `fsck` if you like.

Then rebuild the initramfs - `mkinitcpio -p linux` and reboot - your disk
should resize as it boots up.

## Baking into a cloud image

See [my arch OpenStack image
script](https://github.com/GregSutcliffe/openstack-build-scripts/blob/master/build-arch)
for an example of building an Arch OpenStack image - just add
`mkinitcpio-growrootfs` to the list of packages to install in your image as
it's built.

# Caveats

Current only supports ext filesystems - I need to find a way to detect the
filesystem type so that I can call the appropriate resize tool. Until then,
`resize2fs` is baked in.

# Copyright / License

Copyright Greg Sutcliffe (greg.sutcliffe@gmail.com) 2013. License is GPLv3.

`growpart` is copyright Scott Moser <scott.moser@canonical.com> and is GPLv3
