#!/bin/bash

# Is root running this script?
if [ "`id -u`" -ne 0 ]
then
  echo -e "\n\nRun this script as root!\n\n"
  exit -1
fi

# reinstall wxgtk and extract libwx*3.1.so* files from wxgtk-dev packages into /usr/lib/
pacman -S wxgtk-common wxgtk2 wxgtk3
tar -xf /var/cache/pacman/pkg/wxgtk-common-dev* -C / --wildcards --no-anchored 'libwx*.so*'
tar -xf /var/cache/pacman/pkg/wxgtk2-dev* -C / --wildcards --no-anchored 'libwx*.so*'
tar -xf /var/cache/pacman/pkg/wxgtk3-dev* -C / --wildcards --no-anchored 'libwx*.so*'