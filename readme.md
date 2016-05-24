
## initrd-dropbear

### Summary 

Provider of systemd initramfs dropbear ssh server

### Example

change /etc/mkinitcpio.conf
```
HOOKS="base systemd initrd-dropbear sd-encrypt"
```

### Details

pacman install actions:
* provision default files included in this package into the /etc
* specific folders are /etc/dropbear /etc/systemd/{system,network}

mkinitcpio install hook actions:
* look in the /etc/dropbear /etc/systemd/{system,network}
* include in initrd files containing marker "/etc/initrd-release"
* activate in initrd transitively any discovered systemd service units 

to disable specific file inclusion / unit activation:
* mangle or remove the tag marker string "/etc/initrd-release"
* for example replace "/etc/initrd-release" with "/etc/xxx/initrd-release"
