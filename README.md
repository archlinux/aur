# ArchLinux UEFI SecureBoot script

Language: English | [中文](README.zh.md)

## Installation

### Build package from sources

1. First clone this repository from GitHub

```bash
git clone https://github.com/BigfootACA/secureboot-utils
cd secureboot-utils
```

​ Or clone from Code Cloud
```bash
git clone https://gitee.com/ClassFun/secureboot-utils
cd secureboot-utils
```

2. Run makepkg
```bash
makepkg
```
After the build is successful, an ArchLinux software package will be generated

3. Use pacman to install the package

```bash
pacman -U secureboot-utils-1.1-1-any.pkg.tar.xz
```

### Install from AUR

Use yaourt:

```bash
yaourt -S secureboot-utils
```

Use yay:

```bash
yay -S secureboot-utils
```

## Instructions

### First use

1. First you must support UEFI on your computer
```bash
ls /sys/firmware/efi
```
​ Or check from the BIOS.

2. Then confirm that your computer supports SecureBoot
```bash
ls /sys/firmware/efi/efivars/SecureBoot-*
```
​ Or check from the BIOS.

3. Adjust the SecureBoot mode from the BIOS to custom mode to prepare to import the generated public key
4. Generate public and private keys and write them into the firmware system
```bash
secureboot-keygen
```

SecureBoot has been initialized, but the kernel or boot loader needs to be signed before enabling SecureBoot. Please check the following related content.

### Rewrite the public key to the firmware system

If you need to rewrite the public key to the system, execute the following command:
```bash
secure-write
```

### Sign the kernel

```bash
secureboot-sign --replace /boot/vmlinuz-linux
```

This software package comes with the standard kernel package [linux](https://www.archlinux.org/packages/core/x86_64/linux/) and [linux-lts](https://www.archlinux.org/packages/core/x86_64/linux-lts/), when reinstalling the kernel or upgrading the kernel, it will automatically resign the kernel to ensure normal use after the kernel is upgraded and restarted.

### Sign systemd-boot

```bash
secureboot-sign --systemd-boot
bootctl install
```

This package comes with [systemd](https://www.archlinux.org/packages/core/x86_64/linux/) the installation hook of  will automatically re-sign systemd-boot when reinstalling the kernel or upgrading systemd to ensure normal use after restart.

### Sign GRUB2

```bash
secureboot-sign --replace /boot/efi/EFI/boot/bootx64.efi
secureboot-sign --replace /boot/efi/EFI/arch/grubx64.efi
```
