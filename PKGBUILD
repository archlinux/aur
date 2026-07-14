# dvb-usb-autoload
# Maintainer: Sterophonick

pkgname=dvb-usb-autoload
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Modprobe rule to autoload dvb_usb"
source=("dvb_usb.conf")

package() {
	mkdir -p "${pkgdir}/etc/modules-load.d/"
    cp ./dvb_usb.conf "${pkgdir}/etc/modules-load.d/"
}

