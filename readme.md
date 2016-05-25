#### This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

## mkinitcpio-systemd-tool

### Summary 

Utilities for systemd in initramfs (systemd-tool)
* initrd debugging
* early network setup
* remote ssh access in initrd
* cryptsetup password answer over ssh
* automatic provisioning of binary and config resources

Hook name: systemd-tool

### Example

change /etc/mkinitcpio.conf
```
HOOKS="base systemd systemd-tool sd-encrypt"
```

review and enable/disable provided default service unit files
```
shell.sh
initrd-*.network
initrd-*.service
```

### Details

pacman install actions:
* provision default files included in this package into the /etc
* specific folders are /etc/mkinitcpio.d /etc/systemd/{system,network}

mkinitcpio install hook actions:
* look in the /etc/systemd/system
* include in initrd units containing marker "/etc/initrd-release"
* activate transitively in initrd any discovered systemd service units
* auto provision into initramfs resources declared in the initrd service units  

to disable specific service unit inclusion / unit activation in the initramfs:
* alter the tag marker string ```ConditionPathExists=/etc/initrd-release```
* for example replace path "/etc/initrd-release" with "/etc/xxx/initrd-release"
