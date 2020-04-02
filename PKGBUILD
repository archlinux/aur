# Maintainer: Claudio Lanconelli <lancos@libero.it>

_pkgname=ponyprog
pkgname=$_pkgname-bin
pkgver=3.1.1
pkgrel=431
pkgdesc="PonyProg is a serial device programmer based on some simple and cheap interfaces for the PC"
arch=('x86_64')
url="http://www.LancOS.com"
license=('GPLv2')
depends=("qt5-base" "qt5-multimedia")
provides=("ponyprog")
conflicts=("ponyprog")
source=("https://github.com/lancos/ponyprog/releases/download/v${pkgver}/${_pkgname}-${pkgver}-ubuntu18.04-amd64.deb")
md5sums=("a887688921b83da1647ded151a75046c")

package() {
	tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz
	mv "$pkgdir/lib" "$pkgdir/usr/lib"
}
