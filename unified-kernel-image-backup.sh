#!/bin/sh

set -eu

# unified-kernel-image-backup.sh
# Saves a backup copy of the currently-booted unified kernel image
# Depends on binutils

# Limitations:
# * The EFI partition must be mounted
# * The EFI loader image must not have a ")" character in its path/name
# * The EFI partition must have enough space to make the backup copy

# Output:
# * <image-name>-last.efi
# * <image-name>-last.txt

# Setup:
# efibootmgr -v --create --disk /dev/sda --part 1 --label 'Arch Linux (last booted kernel)' --loader '\EFI\ARCH\linux-x64-last.efi'
# -or-
# efibootmgr -v --create --disk /dev/nvme0n1 --part 1 --label 'Arch Linux (last booted kernel)' --loader '\EFI\ARCH\linux-x64-last.efi'

# 1. Find the currently-booted efi image
# 2. Determine if it is an Arch unified kernel image
# 3. Determine if it is already saved
# 4. Save a copy of the currently-booted image


# Example efibootmgr output:
#BootCurrent: 0002
#Timeout: 1 seconds
#BootOrder: 0002,0000,0001,0004,0003
#Boot0000* Arch Linux Grub	HD(1,GPT,00000000-0000-4000-0000-000000000000,0x1000,0x1ff800)/File(\EFI\ARCH\grubx64.efi)
#Boot0001* Linux Recovery	HD(1,GPT,00000000-0000-4000-0000-000000000000,0x1000,0x1ff800)/File(\EFI\LinuxRecovery\grubx64.efi)
#Boot0002* Arch Linux	HD(1,GPT,00000000-0000-4000-0000-000000000000,0x1000,0x1ff800)/File(\EFI\ARCH\linux-x64.efi)
#Boot0003* Arch Linux (last booted kernel)	HD(1,GPT,00000000-0000-4000-0000-000000000000,0x1000,0x1ff800)/File(\EFI\ARCH\linux-x64-last.efi)
#Boot0004* Windows Boot Manager	HD(1,GPT,22222222-2222-4222-2222-222222222222,0x800,0x32000)/File(\EFI\MICROSOFT\BOOT\BOOTMGFW.EFI)WINDOWS.........x...B.C.D.O.B.J.E.C.T.=.{.9.d.e.a.8.6.2.c.-.5.c.d.d.-.4.e.7.0.-.a.c.c.1.-.f.3.2.b.3.4.4.d.4.7.9.5.}....................
#Boot0010  Setup	FvFile(33333333-3333-4333-3333-333333333333)
#Boot0011  Boot Menu	FvFile(55555555-5555-4555-5555-555555555555)

# @see: UEFI Spec, version 2.9, 10.6.1.6 Text Device Node Reference

# Assuming efibootmgr output is stable
efibootmgr -v |
  awk '
    # Identify the current boot entry
    /^BootCurrent:/ { bc = $2 }

    # Get partition and file path information from the current boot entry
    $1 ~ "^Boot" bc {
      # The tab character separates the entry id/name from the device path.
      # There may be tabs in the device path, so use sub() instead of $2 and FS="\t"
      sub("^[^\t]*\t", "");
      print $0;

      # UEFI only supports GPT, so this pattern should be safe enough
      guid_idx = match($0, "GPT,........-....-....-....-............");
      if (!guid_idx) { exit 1; }

      # Extract the EFI partition GUID from the device node
      guid = substr($0, guid_idx + 4, RLENGTH - 4); # 4: length of "GPT,"
      print guid;

      # Extract the path to the EFI image
      file_idx = match($0, "\\)/File\\([^)]*");
      if (!file_idx) { exit 1; }

      # Fix path separator for Linux
      gsub("\\\\", "/");

      print substr($0, file_idx + 7, RLENGTH - 7); # 7: length of ")/File("
    }
  ' |
(
IFS= read -r boot_entry_full
printf '%s\n' "Found current boot entry: $boot_entry_full"
IFS= read -r efi_partuuid
IFS= read -r efi_bin

# findmnt -P is safe to eval. This sets the variable TARGET
eval "$(findmnt -P -o TARGET "/dev/disk/by-partuuid/$efi_partuuid")"

case "$efi_bin" in
  *-last.*)
  if [ -e "${TARGET}${efi_bin%.*}.txt" ]; then
    echo 'Probably booting a saved UEFI Unified Kernel Image; not saving last boot image'
    exit 0
  fi
  ;;
esac

if ! objcopy -O binary --only-section .osrel "${TARGET}${efi_bin}" /dev/stdout | grep -qFx 'NAME="Arch Linux"'; then
  # FIXME: does this work with the dracut-generated images?
  echo 'Probably not a UEFI Unified Kernel Image; not saving last boot image'
  exit 0
fi

efi_bin_save="${TARGET}${efi_bin%.*}-last.${efi_bin##*.}"
efi_bin_save_txt="${efi_bin_save%.*}.txt"
boot_uname_current="$(uname -r)"
if [ -e "$efi_bin_save_txt" ]; then
  boot_uname_saved="$(cat "$efi_bin_save_txt")"
  if [ "$boot_uname_saved" = "$boot_uname_current" ]; then
    echo 'UEFI Unified Kernel Image already saved'
    exit 0
  fi
fi

# FUTURE: save multiple versions and clean up old versions with a timer/hook?
#efi_bin_save="${TARGET}${efi_bin%.*}-$(uname -r).${efi_bin##*.}"
#if [ -e "$efi_bin_save" ]; then
#  exit 0;
#fi

echo 'Saving UEFI Unified Kernel Image'
cp -av -- "${TARGET}${efi_bin}" "$efi_bin_save"
printf '%s\n' "$boot_uname_current" >"$efi_bin_save_txt"
)

echo 'Done'

#objcopy -O binary --only-section .osrel /boot/efi/EFI/arch/linux-x64.efi /dev/stdout
