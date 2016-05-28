#### This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

## mkinitcpio-systemd-tool

### Summary 

Provisioning tool for systemd in initramfs (systemd-tool)

Features:
* initrd debugging
* early network setup
* remote ssh access in initrd
* cryptsetup password answer over ssh
* unified systemd + mkinitcpio configuration
* automatic provisioning of binary and config resources
* on-demand invocation of mkinitcpio scripts and in-line functions 

mkinitcpio hook name: `systemd-tool`

### Example

Basic usage steps:

1) activate required hooks in `/etc/mkinitcpio.conf`:
`
HOOKS="base systemd systemd-tool"
`

2) review, change and enable/disable provided default files:
`
/etc/mkinitcpio.d/shell.sh
/etc/systemd/network/initrd-*.network
/etc/systemd/system/initrd-*.service
`

3) build initrd and reboot

### Details

`makepkg/pacman` install actions:
* provision default files included in this package into the `/etc`
* specific folders are `/etc/mkinitcpio.d` and  `/etc/systemd/{system,network}`

`mkinitcpio` install hook actions:
* look in the `/etc/systemd/system`
* include in initrd units containing marker `/etc/initrd-release`
* activate transitively in initrd any discovered systemd service units
* auto provision into initramfs resources declared in the initrd service units  

### Frequently Asked Questions

what is the mkinitcpio hook entry provided by this package?
* hook name: `systemd-tool`
* minimum required hooks are: `base systemd systemd-tool`
* recommended hooks are: `base systemd autodetect modconf block filesystems keyboard systemd-tool`

how can I enable my custom service unit in initrd?
* add `[Unit]` entry `ConditionPathExists=/etc/initrd-release`

how can I disable my custom service unit in initrd?
* alter the tag marker string, i.e.: `ConditionPathExists=/etc/xxx/initrd-release`

what is the purpose of `[X-SystemdTool]` section in service unit files?
* it provides configuration interface for `mkinitcpio` provisioning actions
* entries include: `InitrdBinary=`, `InitrdPath=`, `InitrdBuild=`, `InitrdCall=` 

how can I auto-provision my custom service unit binaries into initramfs?
* use `InitrdBinary=/path/target-exec` to provision service binary
* also will be provisioned all `Exec*` entries such as `ExecStart=/bin/program`

how can I auto-provision my custom service unit resources into initramfs?
* use `InitrdPath=/path/to/host/folder-or-file`

how can I relocate folder during provisioning?
* not implemented, source and target folder must use the same location

how can I relocate file and/or change file mode during provisioning?
* use `InitrdPath=/target-file source=/source-file mode=NNN` 

how can I filter directory content during provisioning?
* use `InitrdPath=/target-folder glob=*.example` 

how can I provision optional folder or file?
* use `InitrdPath=/target-file source=/source-file optional=yes`

is there a way to create empty folder or file?
* for empty dir, use `InitrdPath=/path/target-folder/ create=yes` note trailing SLASH
* for empty file, use `InitrdPath=/path/target-file create=yes` note NO trailing slash
* in order to ignore existing host source, add `source=/some-invalid-path` argument

can I invoke a provisioning script related to my service during mkinitcpio build time?
* use `InitrdBuild=/path-to/script.sh command=function_name` 

can I call a little provisioning script snippet during mkinitcpio build time?
* check for available `mkinitcpio` functions in `/usr/lib/initcpio/functions.sh`
* use `InitrdCall=inline-bash-code-here` to call these functions 

how can I provide custom interactive user shell for ssh client
* change sample shell file located in `/etc/mkinitcpio.d/shell.sh`  

which ssh user keys are used by initramfs sshd server? 
* they come from host `/root/.ssh/authorized_keys`

how can I review shell actions during boot?
* use `journalctl -b -t shell`

### List of stable releases

r89
