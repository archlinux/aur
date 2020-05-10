#!/bin/bash
set -e
if [[ $EUID -ne 0 ]]; then
   echo "You must be root to do this." 1>&2
   exit 100
fi
if [ -z $AURLOCAL ]; then
  set -ex
#prompt to enter sky manager IP address
read -p "Please input IP address of the machine hosting it's package cache: " -r
AURLOCAL=${REPLY}
fi

# backup the mirrorlist
[ ! -f /etc/pacman.d/mirrorlist-bak ] && cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-bak

#set the AURLOCAL IP as a mirror for pacman to retrieve updates from
[[ $(cat /etc/pacman.d/mirrorlist | grep "Server = http://$AURLOCAL:8079") = *"Server = http://$AURLOCAL:8079"* ]] && echo "$(echo "Server = http://$AURLOCAL:8079" | cat - /etc/pacman.d/mirrorlist-bak)" > /root/mirrorlist && mv /root/mirrorlist /etc/pacman.d/mirrorlist

#backup pacman.conf
[ ! -f /etc/pacman.conf-bak ] && cp /etc/pacman.conf /etc/pacman.conf-bak

#add the skyminer repo to pacman.conf
[[ $(cat /etc/pacman.conf | grep "aur-local") != *"aur-local"* ]] && cat /etc/pacman.conf-bak > /root/pacman.conf && echo -e "
[aur-local]
SigLevel = PackageOptional
Server = http://$AURLOCAL:8079
" >> /root/pacman.conf && mv /root/pacman.conf /etc/pacman.conf
