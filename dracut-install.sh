#!/usr/bin/env bash

args=('--force' '--strip' '--aggressive-strip' '--reproducible')

while read -r line; do
	if [[ "$line" == 'usr/lib/modules/'+([^/])'/pkgbase' ]]; then
		read -r pkgbase < "/${line}"
		kver="${line#'usr/lib/modules/'}"
		kver="${kver%'/pkgbase'}"

		install -Dm0644 "/${line%'/pkgbase'}/vmlinuz" "/boot/vmlinuz-${pkgbase}"

		# detect if the ESP directory is /boot or /efi
		efi_dirpath="/boot/EFI/Linux"
		if [ -d "/efi/EFI" ]; then
			efi_dirpath="/efi/EFI/Linux"
		fi

		dracut "${args[@]}" --kver "$kver" --uefi "${efi_dirpath}/${pkgbase}.efi"
		#dracut --no-hostonly --no-hostonly-cmdline "${args[@]}" "/boot/initramfs-${pkgbase}-fallback.img" --kver "$kver"
		
		sbctl sign -s -o  "${efi_dirpath}/${pkgbase}.efi"  "${efi_dirpath}/${pkgbase}.efi"

		if [ -f "${efi_dirpath}/${pkgbase}-fallback.efi" ]; then
			sbctl sign -s -o  "${efi_dirpath}/${pkgbase}-fallback.efi"  "${efi_dirpath}/${pkgbase}-fallback.efi"
		fi
	fi
done
