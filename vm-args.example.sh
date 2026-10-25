# Example vm-args.sh for qemu-apple-t8030 (iPhone 11 / n104ap, real SEP).
# Copy to ${XDG_DATA_HOME:-~/.local/share}/qemu-apple-t8030/vm-args.sh and edit.
#
# This file is sourced by the launcher from inside DIR/data/, with D set to DIR.
# It must set the MAINARGS array. Do not set Q (the launcher uses the packaged
# emulator; override with QEMU_T8030_BIN if you really want another one).
#
# Every file named here is YOURS, produced by following the official guide
# (https://chefkiss.dev/applehax/inferno/). The names below are placeholders for
# an iOS 14 n104ap restore; yours depend on the IPSW you used.
#
# The USB link socket (usb-conn-addr) is only used with a companion VM; the
# launcher's --companion runs DIR/companion.sh to start one.

SEP_FW="$D/private/sep-firmware.n104.RELEASE.new.img4"   # your repacked SEP firmware
SEP_ROM="$D/private/AppleSEPROM-Cebu-B1"                  # your SEP ROM dump
TRUSTCACHE=./Restore/Firmware/XXX-XXXXX-XXX.dmg.trustcache
KERNEL=./Restore/kernelcache.research.iphone12b
DTB=./Restore/Firmware/all_flash/DeviceTree.n104ap.im4p

ns() {  # ns FILE ID NSID NSTYPE [format]
  MAINARGS+=(-drive "file=$1,format=${5:-raw},if=none,id=$2"
             -device "nvme-ns,drive=$2,bus=nvme-bus.0,nsid=$3,nstype=$4,logical_block_size=4096,physical_block_size=4096")
}

MAINARGS=(
  -M "t8030,trustcache=$TRUSTCACHE,ticket=root_ticket.der,sep-fw=$SEP_FW,sep-rom=$SEP_ROM,kaslr-off=true,usb-conn-type=unix,usb-conn-addr=$D/logs/usb.sock"
  -kernel "$KERNEL" -dtb "$DTB"
  -append "tlto_us=-1 mtxspin=-1 agm-genuine=1 agm-authentic=1 agm-trusted=1 serial=3 wdt=-1 -vm_compressor_wk_sw"
  -smp 7 -m 4G
  -drive file=sep_nvram,if=pflash,format=raw
  -drive file=sep_ssc,if=pflash,format=raw
)
ns root.qcow2  root       1 1 qcow2   # or "root" (raw) if that is what you created
ns firmware    firmware   2 2
ns syscfg      syscfg     3 3
ns ctrl_bits   ctrl_bits  4 4
MAINARGS+=(-drive file=nvram,if=none,format=raw,id=nvram
           -device apple-nvram,drive=nvram,bus=nvme-bus.0,nsid=5,nstype=5,id=nvram,logical_block_size=4096,physical_block_size=4096)
ns effaceable  effaceable 6 6
ns panic_log   panic_log  7 8
