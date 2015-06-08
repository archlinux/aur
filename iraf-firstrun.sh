#!/bin/bash

echo "Performing initial IRAF installation"
if [ `id -u` != "0" ]; 
then
  echo "root previleges required, exit..."
  exit 1
else
  echo "Install IRAF"
  /iraf/iraf/unix/hlib/install.csh
  echo "Install IRAF X11"
  cd /usr/local/src/x11iraf
  /usr/local/src/x11iraf/install
fi
