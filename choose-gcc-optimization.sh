#!/usr/bin/env bash

. /usr/share/makepkg/util/message.sh
colorize

Detect_CPU=$(gcc -c -Q -march=native --help=target | grep march | awk '{print $2}')

msg "Detected CPU architecture: $Detect_CPU"

cat << EOF

    Available CPU microarchitectures:

    1) AMD K6/K6-II/K6-III
    2) AMD Athlon/Duron/K7
    3) AMD Opteron/Athlon64/Hammer/K8
    4) AMD Opteron/Athlon64/Hammer/K8 with SSE3
    5) AMD 61xx/7x50/PhenomX3/X4/II/K10
    6) AMD Family 10h (Barcelona)
    7) AMD Family 14h (Bobcat)
    8) AMD Family 16h (Jaguar)
    9) AMD Family 15h (Bulldozer)
   10) AMD Family 15h (Piledriver)
   11) AMD Family 15h (Steamroller)
   12) AMD Family 15h (Excavator)
   13) AMD Family 17h (Zen)
   14) Transmeta Crusoe
   15) Transmeta Efficeon
   16) IDT Winchip C6
   17) Winchip-2/Winchip-2A/Winchip-3
   18) AMD Elan
   19) Geode GX1 (Cyrix MediaGX)
   20) AMD Geode GX and LX
   21) Cyrix III or C3
   22) VIA C3 "Nehemiah"
   23) VIA C7
   24) Intel Pentium 4, Pentium D and older Nocona/Dempsey Xeon CPUs with Intel 64bit
   25) Intel Atom
   26) Intel Core 2 and newer Core 2 Xeons (Xeon 51xx and 53xx)
   27) Intel 1st Gen Core i3/i5/i7-family (Nehalem)
   28) Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
   29) Intel Silvermont
   30) Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
   31) Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
   32) Intel 4th Gen Core i3/i5/i7-family (Haswell)
   33) Intel 5th Gen Core i3/i5/i7-family (Broadwell)
   34) Intel 6th Gen Core i3/i5/i7-family (Skylake)
   35) Intel 6th Gen Core i7/i9-family (Skylake X)
   36) Intel 8th Gen Core i3/i5/i7-family (Cannon Lake)
   37) Intel 8th Gen Core i7/i9-family (Ice Lake)

   38) Native optimizations autodetected by GCC

    0) Generic (default)
    
EOF

sleep 1
answer=$1

case $answer in
    1) Microarchitecture=CONFIG_MK6 ;;
    2) Microarchitecture=CONFIG_MK7 ;;
    3) Microarchitecture=CONFIG_MK8 ;;
    4) Microarchitecture=CONFIG_MK8SSE3 ;;
    5) Microarchitecture=CONFIG_MK10 ;;
    6) Microarchitecture=CONFIG_MBARCELONA ;;
    7) Microarchitecture=CONFIG_MBOBCAT ;;
    8) Microarchitecture=CONFIG_MJAGUAR ;;
    9) Microarchitecture=CONFIG_MBULLDOZER ;;
   10) Microarchitecture=CONFIG_MPILEDRIVER ;;
   11) Microarchitecture=CONFIG_MSTEAMROLLER ;;
   12) Microarchitecture=CONFIG_MEXCAVATOR ;;
   13) Microarchitecture=CONFIG_MZEN ;;
   14) Microarchitecture=CONFIG_MCRUSOE ;;
   15) Microarchitecture=CONFIG_MEFFICEON ;;
   16) Microarchitecture=CONFIG_MWINCHIPC6 ;;
   17) Microarchitecture=CONFIG_MWINCHIP3D ;;
   18) Microarchitecture=CONFIG_MELAN ;;
   19) Microarchitecture=CONFIG_MGEODEGX1 ;;
   20) Microarchitecture=CONFIG_MGEODE_LX ;;
   21) Microarchitecture=CONFIG_MCYRIXIII ;;
   22) Microarchitecture=CONFIG_MVIAC3_2 ;;
   23) Microarchitecture=CONFIG_MVIAC7 ;;
   24) Microarchitecture=CONFIG_MPSC ;;
   25) Microarchitecture=CONFIG_MATOM ;;
   26) Microarchitecture=CONFIG_MCORE2 ;;
   27) Microarchitecture=CONFIG_MNEHALEM ;;
   28) Microarchitecture=CONFIG_MWESTMERE ;;
   29) Microarchitecture=CONFIG_MSILVERMONT ;;
   30) Microarchitecture=CONFIG_MSANDYBRIDGE ;;
   31) Microarchitecture=CONFIG_MIVYBRIDGE ;;
   32) Microarchitecture=CONFIG_MHASWELL ;;
   33) Microarchitecture=CONFIG_MBROADWELL ;;
   34) Microarchitecture=CONFIG_MSKYLAKE ;;
   35) Microarchitecture=CONFIG_MSKYLAKEX ;;
   36) Microarchitecture=CONFIG_MCANNONLAKE ;;
   37) Microarchitecture=CONFIG_MICELAKE ;;
   38) Microarchitecture=CONFIG_MNATIVE ;;
    *) default=CONFIG_GENERIC_CPU ;;
esac

warning "According to PKGBUILD variable _microarchitecture, your choice is $answer"
msg "Building this package for microarchitecture: $Microarchitecture$default"
sleep 5

sed -e 's|^CONFIG_GENERIC_CPU=y|# CONFIG_GENERIC_CPU is not set|g' -i .config
sed -e "s|^# $Microarchitecture is not set|$Microarchitecture=y|g" -i .config

echo
