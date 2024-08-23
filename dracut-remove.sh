#!/usr/bin/env bash

while read -r line; do
	if [[ "$line" == 'usr/lib/modules/'+([^/])'/pkgbase' ]]; then
		read -r pkgbase < "/${line}"
		rm -f "/boot/vmlinuz-${pkgbase}"
		rm -f "/boot/initramfs-${pkgbase}.img"

		# detect if the ESP directory is /boot or /efi
		efi_dirpath="/boot/EFI/Linux"
		if [ -d "/efi/EFI" ]; then
			efi_dirpath="/efi/EFI/Linux"
		fi

		# remove the efi file
		if [ -f "${efi_dirpath}/${pkgbase}.efi" ]; then
			sbctl remove-file "${efi_dirpath}/${pkgbase}.efi"
			rm -f "${efi_dirpath}/${pkgbase}.efi"
		fi

		# remove the efi fallback file
		if [ -f "${efi_dirpath}/${pkgbase}-fallback.efi" ]; then
			sbctl remove-file "${efi_dirpath}/${pkgbase}-fallback.efi"
			rm -f "${efi_dirpath}/${pkgbase}-fallback.efi"
		fi
	fi
done
