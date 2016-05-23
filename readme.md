
## initrd-dropbear

### Summary 

Provider of systemd initramfs dropbear ssh server

### Example

/etc/mkinitcpio.conf
HOOKS="base systemd initrd-dropbear sd-encrypt"

### Details

pacman install actions:
* look in the /etc/systemd/{system,network}
* if there are no files containing marker "/etc/initrd-release"
* then provision example / default files included in this package into the /etc

mkinitcpio install hook actions:
* look in the /etc/systemd/{system,network}
* include in initrd files containing marker "/etc/initrd-release"
* activate in initrd transitively any discovered systemd service units 

to disable specific file inclusion / unit activation:
* mangle or remove the marker string "/etc/initrd-release"
* example: replace "/etc/initrd-release" with "/etc/xxx/initrd-release"
