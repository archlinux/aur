# Maintainer: Krystian Chachula <krystiancha@gmail.com>
pkgname=raspberrypi-udev
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Udev rules for Raspberry Pi found in Raspbian"
arch=('any')
url=""
license=('unknown')
source=("raspberrypi.rules")
md5sums=("22509313cf920303517c1154a0dbfa8f")

package() {
	mkdir -p $pkgdir/usr/lib/udev/rules.d/
	cp raspberrypi.rules $pkgdir/usr/lib/udev/rules.d/raspberrypi.rules
}

