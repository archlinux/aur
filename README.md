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
- add `overlay` to __MODULES__ array in mkinitcpio.conf (in case support for OverlayFS
  is not statically compiled into your kernel)
- add `overlayroot` to the end of __HOOKS__ array in mkinitcpio.conf
- update initramfs with `mkinitcpio -P`

### 2.2 Kernel Command Line
- add `overlayroot` to your kernel command line
- optional:
	- add `opts=<option>,...` to `overlayroot=...`
		 - available options:
			 - `noswap` : deactivate swap space
	- add `tmpfs=/<path>/<to>/<mountpoint>,...` to `overlayroot=...` to overlay
	  filesystems with a tmpfs filesystem
	- add `ro=/<path>/<to>/<mountpoint>,...` to `overlayroot=...` to mount
	  filesystems read-only
	- specify `all` instead of dedicated mountpoints for `tmpfs` or `ro`
	- separate options with a `:`
	- examples: 
		overlayroot=tmpfs=/usr:ro=/boot,/boot/efi
		overlayroot=tmpfs=all:opts=noswap
		overlayroot=ro=all

### 2.3 Configuration File
- path `/etc/overlayroot.conf`
	- `OVLROOT_FS_ROONLY=<fs>,...` filesystems that can't be used as lower layer
		 - examples: `msdos, (v)fat, ntfs-3g`
	- `OVLROOT_FS_RAMONLY=<fs>,...` filesystems that are always ignored by overlayroot
		 - examples: `tmpfs, proc, sysfs`
	- `OVLROOT_FSTAB=/<path>/<to>/<fstab>` modified fstab created by overlayroot 
	  during initramfs phase to replace system-wide fstab
		 - default: `/tmp/overlayroot.fstab`
	- `OVLROOT_MAINDIR=/<path>/<to>/<mountpoint>` mountpoint for tmpfs filesystem
		 - default: `/.overlay`
	- `OVLROOT_LOWDERDIR_NAME=<dirname>` subdirectory of all lower filesystem mounts
		 - default: `ro`
	- `OVLROOT_UPPERDIR_NAME=<dirname>` subdirectory for all changes made to the filesystems
		 - default: `rw`
	- `OVLROOT_WORKDIR_NAME=<dirname>` subdirectory needed by OverlayFS
		 - default: `work`
	- `FSTAB_SYSTEM=/<path>/<to>/<fstab>` system-wide fstab
		 - default: `/etc/fstab`
	- `ROOTMNT=/<path>/<to>/<mountpoint>` mountpoint of root filesystem in initramfs phase
		 - default: `/new_root`




