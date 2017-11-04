## [openshift-origin-git](https://aur.archlinux.org/packages/openshift-origin-git/) is a package for [Arch Linux](https://www.archlinux.org/).

It downloads source code from official [OpenShift Origin](https://docs.openshift.org/latest) [GitHub repository](https://github.com/openshift/origin).

Install script compiles source code, installs three binaries (oc, openshift, kubefed) and seven symlinks (kubectl, kube-apiserver, kube-controller-manager, kubelet, kube-proxy, kube-scheduler, 
oadm) into /usr/bin/ .

I will release this package upon each upstream release.
You can reinstall this package at any time to build binaries based on the latest commit (yaourt --sync openshift-origin-git).


#### Core files

These files are the core of openshift-origin-git package for Arch Linux.

- PKGBUILD
- install.sh
- .SRCINFO

PKGBUILD
- Package build specification.
- Source code is downloaded from GitHub.
- Binaries are built from source code and placed into /usr/bin .
- Some hooks are specified in the following script.

install.sh
- Install script is used when installing, upgrading or removing the package.

.SRCINFO
- Package metadata.


#### Optional script

https://github.com/openshift-evangelists/oc-cluster-wrapper

This wrapper script is optional. It makes it easier to run an Openshift cluster once you have installed the package.
You should probably install it to your path (/usr/local/bin).


#### Dependencies

##### Docker

This package depends on docker package.
docker.service should be enabled and started before running openshift origin cluster.
You have to update docker.service configuration file (/etc/systemd/system/multi-user.target.wants/docker.service) to enable unsecured embedded docker registry.

ExecStart=/usr/bin/docker daemon -s zfs --storage-opt zfs.fsname=ZFS0/docker --insecure-registry 172.30.0.0/16

#### Recommended packages

- lvm2: [LVM](https://wiki.archlinux.org/index.php/LVM): create logical volumes to be used by ZFS .
- lxd: [LXD](https://wiki.archlinux.org/index.php/LXD): create linux containers .
- zfs-dkms: [ZFS](https://wiki.archlinux.org/index.php/ZFS) support . Enable ZFS backend for Docker and LXD .

#### Custom kernel

"Due to security concerns, the default Arch kernel does not ship with the ability to run containers as an unprivileged user. LXD however needs this ability to run. You can either build a kernel yourself that has CONFIG_USER_NS enabled, or use linux-user-ns-enabled from the AUR."

It's easy to build a [custom kernel](https://wiki.archlinux.org/index.php/Kernels/Arch_Build_System) .
