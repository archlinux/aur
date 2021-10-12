# EFI-bootable kernel image builder for Arch Linux

Linux supports EFISTUB booting, where the UEFI can load the kernel directly without any bootloader. This can be done by setting up the boot entries with efibootmgr command (https://wiki.archlinux.org/index.php/EFISTUB). The problem is that **some systems (like Dell XPS laptops) doesn't support passing kernel command line arguments**. This results in failing to boot.

This script builds single-file bootable efi modules, which includes the kernel, command line strings, initramfs and microcode.

EFISTUB booting should not have any negative consequences to anything (hibernation, power management, etc). For my Dell XPS 9560, everything works just fine.

## How it works

Objcopy can be used to merge all the files in single bootable image. See https://wiki.archlinux.org/index.php/systemd-boot, section "Preparing kernels for /EFI/Linux" for more details. You *do not* have to use systemd-boot for this to work.

If you have multiple initrds (ucode and initramfs), then you have to concatenate them to a single file before embedding.

The problem remaining is that this manually builds the kernel, but does not run if you update. Here is where the pacman hooks come handy. It is possible to set up hooks for updating the kernels or the microcode and run the build script automatically (see kernel-update.hook).

## How to install

If your EFI partition is mounted as /boot (as recommended in https://wiki.archlinux.org/index.php/EFI_system_partition) and your kernels are installed there, you can just run 

```
sudo install.sh
```

If not, please edit build_kernel.sh and install it manually. You can do it by running

```
cp build_kernel.sh to /opt
mkdir -p /etc/pacman.d/hooks/
cp kernel-update.hook /etc/pacman.d/hooks
```

When completed, you can use efibootmgr to setup the boot item, or your BIOS settings might have an option to chose the file from the ESP partition (as with Dell XPS 9560). It works either way.

## Custom command line parameters

By default, when you run the script, it extract your current kernel command line to /boot/cmdline.txt. Change it and rerun to include the new paramters. If the file exists, it will *not* overwrite it.

It is also possible to have different command lines for different kernels. You can do this by placing cmdline-<kernel name>.txt in your /boot folder, where the <kernel name> is the part after "vmlinuz-" of your kernel. For example for vmlinuz-linux it is cmdline-linux.txt, for vmlinuz-linux-lts it is cmdline-linux-lts.txt.
