#!/bin/sh

# Part of the dgrp-1.9.35 PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/

# If you remove this script your package will not auto rebuild 
# and your hardware will stop working after the next kernel upgrade.

# Purpose: Automatically build and install this package on the next login
# after pacman removes it on kernel upgrade. 
# Every package that needs to be autorebuilt should have a shell script
# like this one. All you need is a PKGBUILD and a sense file to tell
# when the package is missing.

# This shell script can be easily adapted to any PKGBUILD. As an alternative
# you can look into "DKMS" Dynamic Kernel Module Support.

# To launch, add this to any user's profile or the system profile.
# The preferred user is the one most likely to log on after an upgrade.
# sudo must be installed and configured. Each user expected to rebuild packages
# must be added to the wheel group (usermod -G).

# for install_group in `groups`; do
#   if [ "$install_group" = "wheel" ]; then
#     find ~/pkg -type f -perm /400 -name "autorebuild-*.sh" -exec sh {} \;
#     break
#   fi
# done

# This presumes you have neatly placed all your packages into ~pkg.

# (Note: the multi user aspect has yet to be tested)

# For multiple users you can use a standard folder set to be world writable.

sensefile="/usr/lib/modules/`uname -r`/misc/dgrp.ko"
rebuildtitle="Digi RealPort driver for Ethernet serial servers"

if [ ! -s "$sensefile" ]; then
  if [ "$EUID" -ne "0" ]; then
    cd "`dirname "$0"`" # compatible with cron and find
    #prevumask=`umask`; umask 000
    makepkg -sCcfi
    #umask $prevumask
    ## Allow other users to build without permissions interference
    ## This would be a security problem in most environments
    ## chmod 777 files with any x bit set
    #find . -type f ! "(" -perm 666 -o -perm 777 ")" -a -perm /111 -exec chmod 777 {} \;
    ## chmod 666 files without any x bit set
    #find . -type f ! "(" -perm 666 -o -perm 777 ")" -a "!" -perm /111 -exec chmod 666 {} \;
    ## chmod 777 files with any x bit set
    #find . -type d ! -perm 777 -exec chmod 777 {} \;
  else
    # su user -c "$*" # this might work if you need the root user to rebuild.
    echo "`tput clear`"
    echo "Important. A recent kernel upgrade has diabled your"
    echo ""
    echo "$rebuildtitle"
    echo "Status: Disabled!"
    echo ""
    echo "It is easy to rebuild and enable but not by a root user."
    echo "You must log in as a non root user with sudo access (wheel group) and"
    echo ""
    echo "run: $0"
    echo ""
    echo "if it doesn't start automatically."
    echo "Press Enter"
    read autorebuild
  fi
else
  echo "$rebuildtitle already installed"
fi
