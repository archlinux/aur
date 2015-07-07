#Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgname=wacom-udev
pkgver=20140121
pkgrel=1
pkgdesc="UDEV rules for Wacom devices"
arch=('any')
url="http://linuxwacom.sourceforge.net/"
license=('GPL')
conflicts=('linuxwacom-cvs' 'linuxwacom-baboo-cth-ctl')
source=(10-wacom.rules)
md5sums=('72a0dfd0fb34e837d8efd27f6f9cfe68')

build() {
  true
}

package() {
  msg "Installing udev rules..."
  install -D -m644 "${srcdir}/10-wacom.rules" "${pkgdir}/usr/lib/udev/rules.d/10-wacom.rules"
}

