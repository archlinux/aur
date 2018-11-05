#/usr/bin/bash
SUR_MODEL="$(dmidecode | grep "Product Name" -m 1 | xargs | sed -e 's/Product Name: //g')"
SUR_SKU="$(dmidecode | grep "SKU Number" -m 1 | xargs | sed -e 's/SKU Number: //g')"
if [ "$SUR_MODEL" = "Surface Pro 3" ]; then
	echo "Installing i915 firmware for Surface Pro 3..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_bxt.zip -d "/lib/firmware/i915"
fi
if [ "$SUR_MODEL" = "Surface Pro" ]; then
	echo "Installing IPTS firmware for Surface Pro 2017..."
	mkdir -p "/lib/firmware/intel/ipts"
	unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v102.zip -d "/lib/firmware/intel/ipts"

	echo "Installing i915 firmware for Surface Pro 2017..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_kbl.zip -d "/lib/firmware/i915"
fi
if [ "$SUR_MODEL" = "Surface Pro 4" ]; then
	echo "Installing IPTS firmware for Surface Pro 4..."
	mkdir -p "/lib/firmware/intel/ipts"
	unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v78.zip -d "/lib/firmware/intel/ipts/"

	echo "Installing i915 firmware for Surface Pro 4..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_skl.zip -d "/lib/firmware/i915/"
fi
if [ "$SUR_MODEL" = "Surface Pro 2017" ]; then
	msg2 "Installing IPTS firmware for Surface Pro 2017..."
	mkdir -p "/lib/firmware/intel/ipts"
	unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v102.zip -d "/lib/firmware/intel/ipts/"

	msg2 "Installing i915 firmware for Surface Pro 2017..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_kbl.zip -d "/lib/firmware/i915/"
fi
if [ "$SUR_MODEL" = "Surface Laptop" ]; then
	echo "Installing IPTS firmware for Surface Laptop..."
	mkdir -p "/lib/firmware/intel/ipts"
	unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v79.zip -d /lib/firmware/intel/ipts/

	echo "Installing i915 firmware for Surface Laptop..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_skl.zip -d "/lib/firmware/i915/"
fi
if [ "$SUR_MODEL" = "Surface Book" ]; then
	echo "Installing IPTS firmware for Surface Book..."
	mkdir -p "/lib/firmware/intel/ipts"
	unzip -o /usr/firmware/ipts_firmware_v76.zip -d "/lib/firmware/intel/ipts/"

	echo "Installing i915 firmware for Surface Book..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_skl.zip -d "/lib/firmware/i915/"
fi
if [ "$SUR_MODEL" = "Surface Book 2" ]; then
	echo "Installing IPTS firmware for Surface Book 2..."
	mkdir -p "/lib/firmware/intel/ipts"
	if [ "$SUR_SKU" = "Surface_Book_1793" ]; then
		unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v101.zip -d "/lib/firmware/intel/ipts/"
	else
		unzip -o /usr/share/%PKGBASE%/firmware/ipts_firmware_v137.zip -d "/lib/firmware/intel/ipts/"
	fi

	echo "Installing i915 firmware for Surface Book 2..."
	mkdir -p "/lib/firmware/i915"
	unzip -o /usr/share/%PKGBASE%/firmware/i915_firmware_kbl.zip -d "/lib/firmware/i915/"

	echo "Installing nvidia firmware for Surface Book 2..."
	mkdir -p "/lib/firmware/nvidia/gp108"
	unzip -o /usr/share/%PKGBASE%/firmware/nvidia_firmware_gp108.zip -d "/lib/firmware/nvidia/gp108/"
fi

echo "Install marvell firmware..."
mkdir -p "/lib/firmware/mrvl/"
unzip -o /usr/share/%PKGBASE%/firmware/mrvl_firmware.zip -d "/lib/firmware/mrvl/"
