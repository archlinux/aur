# archlinux-overlayroot
With _overlayroot_ you can overlay your root filesystem with a temporary tmpfs
filesystem to mount it read-only afterwards. Any changes are written to the
tmpfs filesystem (which resides in memory), so that these changes are discarded
on reboot or a loss of power does not threaten the integrity of the system's 
root filesystem. Additionally you can configure further filesystems that you
want either overlayed by a tmpfs filesystem, too or mounted read-only because
write access is not needed and you want to protect it against changes.

## 1. Installation

### 1.1 Building Package
- change your current working directory to the directory containing the files
  of the repository
- run `makepkg`

#### 1.2 Install Package
- build or download package
- run `pacman -U /<path>/<to>/overlayroot-<version>-any.pkg.tar.zst`

## 2. Configuration

### 2.1 Initramfs
- add `overlay` to __MODULES__ array in mkinitcpio.conf (in case support for
  OverlayFS is not statically compiled into your kernel)
- add `ovlroot` to the end of __HOOKS__ array in mkinitcpio.conf
- update initramfs with `mkinitcpio -P`

### 2.2 Kernel Command Line
- add `ovlroot` to your kernel command line
- optional:
	- add the name of your configuration file like this `ovlroot=<config>`

### 2.3 Configuration File
- directory for configuration files is `/etc/ovlroot.d`
- to apply changes to configuration files run `mkinitcpio -P`
- configuration files can contain the following options:
	- `OVLROOT_INIT_ROOTMNT=/<path>/<to>/<rootfs>` absolute path of the mountpoint
	  of the root filesystem during initramfs stage (default value: `/new_root`)
	- `OVLROOT_BASE_TYPE=<fstype>` type of underlying filesystem
	  (default value: `tmpfs`)
    - `OVLROOT_BASE_OPTS=<opt>,...` options to add to the mount of the underlying
	  filesystem either `tmpfs` or an other filesystem, e. g. block-based
	- `OVLROOT_BASE_DEV=<dev>` source device for underlying filesystem, e. g.
	  `tmpfs` or a block device (default value: `tmpfs`)
	- `OVLROOT_BASE_DIR=/<path>/<to>/<mountpoint>` absolute path of the mountpoint
	  for underlying filesystem (default value: `/.ovlroot`)
	- `OVLROOT_BASE_CLEAN=<value>` when the base filesystem is for example a
	  block device, any remaining data is erased when value is `ỳ` or not when
	  value is `n` (default value: `n`)
	- `OVLROOT_LOWER_DIR=<dirname>` relative path of the subdirectory of all
	  lower filesystem mounts (default value: `lowerdir`)
	- `OVLROOT_UPPER_DIR=<dirname>` relative path of the subdirectory for all
	  changes made to the filesystems (default value: `upperdir`)
	- `OVLROOT_WORK_DIR=<dirname>` relative path of the subdirectory needed by
	  OverlayFS
	- `OVLROOT_FSTAB=/<path>/<to>/<fstab>` absolute path to system fstab
	  (default value: `/etc/fstab`)
	- `OVLROOT_NEW_FSTAB=/<path>/<to>/<fstab>` absolute path where new fstab is
	  created (default value: `/tmp/new_fstab`)
	- `OVLROOT_LOWER_MODE=<mode>` lower mounts are either `rw` (read-write) or
	  `ro` (read-only) (default value: `ro`)
	- `OVLROOT_OVL_OPTS_ROOT=<opt>,...` options added to the mount options of
	  the root overlay mount
	- `OVLROOT_OVL_OPTS_OTHER=<opt>,...` options added to the mount options of
	  the overlay mounts given in `OVLROOT_OVERLAY`
	- `OVLROOT_ROOT_FSTAB_OPTS=<value>` the root filesystem is remounted with
	  the options listed in the system's fstab, ether `y` for yes or `n` for no
	  (default value: `n`)
	- `OVLROOT_ABORT_RO_ON_ERROR=<value>` stops (`y`) or continues (`n`) rollback
	  of changes made by the script in case of error
	- `OVLROOT_LIST_SEP=<separator>` character to separate list elements in
	  `OVLROOT_OVERLAY`,`OVLROOT_RDONLY` and `OVLROOT_DISABLE` (default value: `,`)
	- `OVLROOT_OVERLAY=<mountpoint>,...` list of mountpoints for which further
	  overlays are created
	- `OVLROOT_RDONLY=<mountpoint>,...` list of mountpoints that are mounted
	  read-only
    - `OVLROOT_DISABLE=<mountpoint>,...` list of mountpoints that are disabled
	- `OVLROOT_SWAP=<value>` disables (`off`) or enables (`on`) swap
	  (default value: `on`)

