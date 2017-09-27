# Maintainer: Adam Jedlička <adajedlicka@gmail.com>
pkgname="filius"
pkgver="1.7.2"
pkgrel=2
epoch=
pkgdesc=""
arch=('x86_64')
url="http://www.lernsoftware-filius.de/downloads/"
license=('GPL')
makedepends=(rpmextract)
file="$url$pkgname-$pkgver-$pkgrel.noarch.rpm"
source=("$file")
md5sums=("d9f0cf2580c0a324e29e1d3036620542")

package() {
	cd $srcdir
	cp -r usr/ etc/ $pkgdir
}
