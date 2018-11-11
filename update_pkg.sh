#!/bin/bash

ver=$(curl -sL 'https://packages.ubuntu.com/cosmic/amd64/chromium-codecs-ffmpeg-extra/download' |pup 'kbd text{}'|head -n1 | cut -d_ -f2)
md5=$(curl -sL 'https://packages.ubuntu.com/cosmic/amd64/chromium-codecs-ffmpeg-extra/download' |pup '#pdownloadmeta tr:nth-child(2) tt text{}'|head -n1)

ver1=$(echo $ver | cut -d\- -f1)
ver2=$(echo $ver | cut -d\- -f2)

sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^pkgver2=.*$|pkgver2=${ver2}|" PKGBUILD
sed -i "s|^md5sums.*$|md5sums=(\"${md5}\")|" PKGBUILD
