# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber-bin
_pkgbase=inputplumber
pkgver=v0.16.0
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
url="https://github.com/ShadowBlip/inputplumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
provides=('inputplumber')
conflicts=('inputplumber-git')
source=(inputplumber-$pkgver.tar.gz::https://github.com/ShadowBlip/inputplumber/releases/download/$pkgver/inputplumber.tar.gz)

sha256sums=('49fcd2de4c077565d3e09a8df95476831cd1628f537fe40221f42425c5a1decd')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
