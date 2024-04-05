# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber-bin
_pkgbase=inputplumber
pkgver=v0.12.0
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
url="https://github.com/ShadowBlip/inputplumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
provides=('inputplumber')
conflicts=('inputplumber-git')
source=(inputplumber-$pkgver.tar.gz::https://github.com/ShadowBlip/inputplumber/releases/download/$pkgver/inputplumber.tar.gz)

sha256sums=('7a56dbe9d114cb24e9a42471e0596291e74c1627b6b4d609f2a88e9ed3a1c81a')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
