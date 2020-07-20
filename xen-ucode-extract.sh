#!/bin/bash -e


do_firmware() {

	if [ "$1" == "intel" ]; then
		UCODE_RD="/boot/intel-ucode.img"
		XEN_EFI_UCODE="/boot/xen-efi-intel-ucode.bin"
		UCODE_ORIG_BIN="kernel/x86/microcode/GenuineIntel.bin"
	elif [ "$1" == "amd" ]; then
		UCODE_RD="/boot/amd-ucode.img"
		XEN_EFI_UCODE="/boot/xen-efi-amd-ucode.bin"
		UCODE_ORIG_BIN="kernel/x86/microcode/AuthenticAMD.bin"
	fi

	# remove old file
	if [ -f $XEN_EFI_UCODE ]; then
		rm $XEN_EFI_UCODE
	fi

	# create new file
	if [ -f $UCODE_RD ]; then
		bsdtar -Oxf $UCODE_RD $UCODE_ORIG_BIN > $XEN_EFI_UCODE || exit 1
	fi


}

if [ -f "/boot/intel-ucode.img" ]; then
	do_firmware "intel"
fi

if [ -f "/boot/amd-ucode.img" ]; then
	do_firmware "amd"
fi

exit 0
