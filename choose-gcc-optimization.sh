#!/usr/bin/env bash

. /usr/share/makepkg/util/message.sh
colorize

Detect_CPU=$(gcc -c -Q -march=native --help=target | grep march | awk '{print $2}' | head -1)

msg "Detected CPU architecture: $Detect_CPU"

cat << EOF

    Available CPU microarchitectures:

   98) Intel-Native optimizations autodetected by GCC
   99) AMD-Native optimizations autodetected by GCC

    0) Generic (default)
    
EOF

sleep 1
answer=$1

case $answer in
   98) Microarchitecture=CONFIG_MNATIVE_INTEL ;;
   99) Microarchitecture=CONFIG_MNATIVE_AMD ;;
    *) default=CONFIG_GENERIC_CPU ;;
esac

warning "According to PKGBUILD variable _microarchitecture, your choice is $answer"
msg "Building this package for microarchitecture: $Microarchitecture$default"
sleep 5

sed -e 's|^CONFIG_GENERIC_CPU=y|# CONFIG_GENERIC_CPU is not set|g' -i .config
sed -e "s|^# $Microarchitecture is not set|$Microarchitecture=y|g" -i .config

echo
