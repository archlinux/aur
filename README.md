#### This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

## mkinitcpio-systemd-tool

### Summary 

Utilities for systemd in initramfs (systemd-tool)
* initrd debugging
* early network setup
* remote ssh access in initrd
* cryptsetup password answer over ssh
* automatic provisioning of binary and config resources

hook name: `systemd-tool`

### Example

change `/etc/mkinitcpio.conf`
`
HOOKS="base systemd systemd-tool sd-encrypt"
`

review and enable/disable provided default service unit files
`
shell.sh
initrd-*.network
initrd-*.service
`

### Details

pacman install actions:
* provision default files included in this package into the `/etc`
* specific folders are `/etc/mkinitcpio.d` and  `/etc/systemd/{system,network}`

mkinitcpio install hook actions:
* look in the `/etc/systemd/system`
* include in initrd units containing marker `/etc/initrd-release`
* activate transitively in initrd any discovered systemd service units
* auto provision into initramfs resources declared in the initrd service units  

### Frequently Asked Questions

what is the mkinitcpio hook entry for this?
* hook name: `systemd-tool`

how can I enable my custom.service unit in initrd?
* add `[Unit]` entry `ConditionPathExists=/etc/initrd-release`

how can I disable my custom.service unit in initrd?
* alter / remove the tag marker string, i.e.: `ConditionPathExists=/etc/xxx/initrd-release`

how can I auto-provision custom.service unit binaries into initramfs?
* use `InitrdExec=/target-exec` to provision service binary
* any of `Exec*` entries such as `ExecStart=/bin/program` will also be provisioned

how can I auto-provision custom.service unit resources into initramfs?
* add several `[X-SystemdTool]` entries `InitrdPath=/path/to/host/dir-or-file`

which ssh user keys are used by initramfs sshd server?  
* they come from host `/root/.ssh/authorized_keys`

how can provide custom interactive user shell for ssh client
* change sample shell file located in `/etc/mkinitcpio.d/shell.sh`  

how can I relocate file and/or change file mode during provisioning?
* use `InitrdPath=/target-file source=/source-file mode=NNN` 

how can I filter directory content during provisioning?
* use `InitrdPath=/target-folder glob=*.example` 

how can I provision optional folder or file?
* use `InitrdPath=/target-file source=/source-file optional=yes`

how can I relocate folder during provisioning?
* not implemented

