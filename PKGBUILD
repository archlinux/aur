# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber-bin
_pkgbase=inputplumber
pkgver=v0.10.2
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
url="https://github.com/ShadowBlip/inputplumber"
license=('GPL')
depends=('dbus' 'libevdev')
provides=('inputplumber')
conflicts=('inputplumber-git')
source=(inputplumber-$pkgver.tar.gz::https://github.com/ShadowBlip/inputplumber/releases/download/$pkgver/inputplumber.tar.gz)

sha256sums=('0a6229a6300dc05bc5de7dca31475a527941d611b492ceb5b0d1a7ee85d50e44')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
