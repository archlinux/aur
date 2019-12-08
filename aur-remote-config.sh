#!/bin/bash
set -e
if [[ $EUID -ne 0 ]]; then
   echo "You must be root to do this." 1>&2
   exit 100
fi
if [ -z $AURLOCAL ]; then
  set -e
#prompt to enter sky manager IP address
read -p "Please input IP address of the machine hosting it's package cache: " -r
AURLOCAL=${REPLY}
fi

# backup the mirrorlist
if [ ! -f /etc/pacman.d/mirrorlist-bak ]; then
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-bak
fi

#set the AURLOCAL IP as a mirror for pacman to retrieve updates from
echo  "$(echo "Server = http://$AURLOCAL:8080" | cat - /etc/pacman.d/mirrorlist-bak)" > /root/mirrorlist
mv /root/mirrorlist /etc/pacman.d/mirrorlist

#backup pacman.conf
if [ ! -f /etc/pacman.conf-bak ]; then
  cp /etc/pacman.conf /etc/pacman.conf-bak
fi

#add the skyminer repo to pacman.conf
cat /etc/pacman.conf-bak > /root/pacman.conf
echo -e "
[aur-local]
SigLevel = PackageOptional
Server = http://$AURLOCAL:8080
" >> /root/pacman.conf
mv /root/pacman.conf /etc/pacman.conf
