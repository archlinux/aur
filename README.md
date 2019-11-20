# xe-guest-utilities-git

## Purpose
xe-guest-utilities is an add-on package for the [Xen](https://xenproject.org/developers/teams/xen-hypervisor/) and [xcp-ng](https://xcp-ng.org/) hypervisors. As per [documentation](https://xenproject.org/developers/teams/xen-hypervisor/) these tools:
  - Report extra VM info (that only the Operating system can know, not your underlying hypervisor), like VM IP address, kernel version etc.
  - Communicate with the OS in case of quiesce snapshots (Windows and its VSS)
  - Allow sending signals to the OS (clean reboot, hotplug hardware etc.)
This package provides a service file which can be activated/enabled by systemd to provide these features to your VM running with Xen/xcp-ng.

## Source Code
xe-guest-utilities pulls its sourcecode from the [Xenserver](https://github.com/xenserver/xe-guest-utilities) github repository. The source code requires a [Go development environment](https://golang.org/doc/install) in order to successfully compile the code. This script should automatically download the go-pie package, compile and install the script.

## Installation
The PKGBUILD file is hosted on [github](https://github.com/kevdogg/xe-guest-utilities-git) and listed in the [AUR](https://aur.archlinux.org/packages/xe-guest-utilities-git/). The package file can be installed via:
  - Manual Installation - Download PKGBUILD, `makepkg -si` -- [Instructions for Manual Installation of PKGBUILD files](https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages)
  - Automated Installation - Through use of AUR Helper Utilities(yay, trizen, pacaur, etc) [AUR Helper List](https://wiki.archlinux.org/index.php/AUR_helpers) 

The following files are installed by the package: (Listed here in case manual removal is necessary)
  - /usr/share/licenses/xe-guest-utilities-git/LICENSE
  - /usr/share/oem/xs/xe-daemon
  - /usr/share/oem/xs/xe-linux-distribution
  - /usr/lib/udev/rules.d/10-xen-vcpu-hotplug.rules
  - /usr/lib/systemd/system/xe-guest-utilities.service
  - /usr/bin/xenstore
  - /usr/bin/xenstore-exists
  - /usr/bin/xenstore-read
  - /usr/bin/xenstore-rm
  - /usr/bin/xenstore-write


## Activation
Once xe-guest-utilities-git is installed, the service can be started (as root):
```
systemctl start xe-guest-utilities.service
```

The service can be enabled so it will start on subsequent boots:
```
systemctl enable xe-guest-utilities.service
```

### References:
1. https://github.com/xcp-ng/xcp/wiki/Guest-Tools
2. https://github.com/xcp-ng/xe-guest-utilities
3. https://xen-orchestra.com/blog/install-xenserver-tools-in-your-vm/
4. Older version of utilities: https://aur.archlinux.org/packages/xe-guest-utilities/

