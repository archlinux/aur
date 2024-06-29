# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber-bin
_pkgbase=inputplumber
pkgver=v0.26.0
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
url="https://github.com/ShadowBlip/inputplumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
provides=('inputplumber')
conflicts=('inputplumber-git')
source=(inputplumber-$pkgver.tar.gz::https://github.com/ShadowBlip/inputplumber/releases/download/$pkgver/inputplumber.tar.gz)

sha256sums=('0e278a0bde6e8d5ebce251677b7b46ee27bc2fed99dcbf17abad0c2ae843fdc0')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
