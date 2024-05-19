#!/bin/bash
wget -O alarm-mirrorlist.txt https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/pacman-mirrorlist/mirrorlist
grep '^.*Server' alarm-mirrorlist.txt |sed -e 's/^.*Server = //' -e 's/$arch\/$repo$//' >> conf/archlx_mirrors
