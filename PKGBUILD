# dvb-usb-autoload
# Maintainer: Sterophonick

pkgname=dvb-usb-autoload
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Modprobe rule to autoload dvb_usb"
source=("dvb_usb.conf")
sha256sums=("72b5011783c5f283902225c7676ad92e78822456470a213214c130d865ea433c")

package() {
	mkdir -p "${pkgdir}/etc/modules-load.d/"
    cp ./dvb_usb.conf "${pkgdir}/etc/modules-load.d/"
}

