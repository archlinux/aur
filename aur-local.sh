#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "You must be root to do this." 1>&2
   exit 100
fi
#add all packages in yay's cache to custom local repo and symlink them to pacman's cache
repo-add -n /var/lib/pacman/sync/aur-local.db.tar.gz /home/*/.cache/yay/*/*.pkg.tar.xz
ln -f /var/lib/pacman/sync/* /var/cache/pacman/pkg/
ln -f /home/*/.cache/yay/*/*.pkg.tar.xz /var/cache/pacman/pkg/

#add this to pacan.conf
##[aur-local]
#SigLevel = PackageRequired
#Server = <ip-of-other-machine-on-lan>


#Add this to /etc/pacman.d/mirrorlist
#Server = http://<ip-of-other-machine-on-lan>:8080
