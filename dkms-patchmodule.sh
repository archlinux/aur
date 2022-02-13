#!/bin/bash
# kernelver is not set on kernel upgrade, get installed kernel version
if [ -z "$kernelver" ] ; then
    kernelver=$(pacman -Q linux | sed -e 's/linux \(.*\)\.[^.]*/\1/')
fi

vers=(${kernelver//./ })   # split kernel version into individual elements
major="${vers[0]}"
minor="${vers[1]}"
version="$major.$minor"    # recombine as needed
subver=$(grep "SUBLEVEL =" /usr/src/linux/Makefile | tr -d " " | cut -d "=" -f 2)

echo "Downloading kernel source $version.$subver for $kernelver"
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v$major.x/linux-$version.$subver.tar.xz

echo "Extracting original source"
tar -xf linux-$version.$subver.tar.* linux-$version.$subver/$1 --xform=s,linux-$version.$subver/$1,.,

echo "Renaming module"
sed -i 's/snd-usb-audio/snd-usb-audio-fasttrack/g' Makefile

echo "Patching module source"
sed -i 's/IMPLICIT_FB_GENERIC_DEV(0x0763, 0x208\([01]\))/IMPLICIT_FB_FIXED_DEV(0x0763, 0x208\1, 0x81, 2)/' implicit.c
