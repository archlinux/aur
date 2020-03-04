# Maintainer: utsi

pkgname=fleep-bin
pkgver=1.0.18
pkgrel=6
pkgdesc="Messenger for all your teams and projects. Fleep enables communication within and across organizations - be it your team chats, project communication or 1:1 conversations."
arch=('x86_64')
url="https://fleep.io/"
license=('custom')
depends=('qt5-webengine' 'qt5-multimedia' 'qt5-quickcontrols')
source=(https://builds.fleep.ee/linux/pool/buster/fleep/fleep_${pkgver}-${pkgrel}_amd64.deb)
sha512sums=('66adb72f2f7aa3cc62a3b7cba1cce69e86d8a1ae50653ea7ce45b2ca03cfaeb567ecd454dc721e2c1d40af41d89c0e64273ba8ec40faa970cbb205b9bd57d072')

build() {
	cd ${srcdir}
	tar xf data.tar.xz
}

package() {
	cd ${srcdir}
	cp -r usr ${pkgdir}
}
