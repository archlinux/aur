#!/bin/bash

aurpkgs=$(< /dev/stdin)
for aurpkg in "$@" "$aurpkgs"; do
  wget https://aur.archlinux.org/packages/${aurpkg:0:2}/${aurpkg}/${aurpkg}.tar.gz
done
