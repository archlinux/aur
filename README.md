# Xen pvhgrub -- Arch Linux Implementation

[PVH](https://wiki.xenproject.org/wiki/Xen_Project_Software_Overview#PVH_.28x86.29) is the newest and apparently most secure virtualization method available to Xen.  It is basically PV inside of an HVM container.   Many of the descriptions of the technology say that only direct kernel boot is currently supported, but this documentation for [Xen 4.12 RC](https://wiki.xenproject.org/wiki/Xen_4.12_RC_test_instructions#PVH_domU_boot_via_grub2) gives instructions for building GRUB2 to boot in PVH mode, allowing the usage of kernels in the PVH domU.

## How to boot Arch under Arch with pvhgrub

First, build and install xen-pvhgrub.

### domU configuration

Basically, you pass pvhgrub as the kernel in a Xen domU.cfg file:

```
name   = "domU"
type   = "pvh"
kernel = "/usr/lib/xen/bin/pvhgrub"
```

And then continue to configure as normal.

## grub.cfg inside the domU

In the ``/boot`` directory of your domU, create a ``grub.cfg`` file:

```
set default=0
set timeout=3

menuentry "Arch Linux" {
  set root=(xen/xvda1)
  linux /boot/vmlinuz-linux root=__ROOT__ rw __OTHEROPTS__
  initrd /boot/initramfs-linux.img
}

menuentry "Arch Linux Fallback" {
  set root=(xen/xvda1)
  linux /boot/vmlinuz-linux __ROOT__ rw __OTHEROPTS__
  initrd /boot/initramfs-linux-fallback.img
}

```

This avoids having to install GRUB2 on the domU, and therefore some complexity.    It might be possible to use the standard GRUB2 configuration options, but I have not tested this and I'm negatively interested in doing so.
