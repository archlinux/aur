# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=official-gamecube-controller-adapter-rules
pkgver=1.0
pkgrel=1
pkgdesc="A rules file for Official GameCube Controller Adapter for Wii U and Nintendo Switch on Linux."
arch=('any')
url="https://wiki.dolphin-emu.org/index.php?title=How_to_use_the_Official_GameCube_Controller_Adapter_for_Wii_U_in_Dolphin"

package() {
	install -dm644 "$pkgdir/etc/udev/rules.d"
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' > "$pkgdir/etc/udev/rules.d/51-gcadapter.rules"
}
