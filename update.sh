#!/bin/bash

json=$(curl -s https://download.ednovas.org)

latest=$(echo "$json" | grep -oP '>Linux</span>.*?class="version-tag">v\K[^<]+')

sed -i -e "s/^pkgver=.*/pkgver=${latest}/" PKGBUILD
sed -i -e 's/pkgrel=.*/pkgrel=1/' PKGBUILD
