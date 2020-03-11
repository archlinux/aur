# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=python2-e3-core
pkgver=21.0.0
pkgrel=1

arch=('any')
pkgdesc="Python2 e3-core library"
url="https://github.com/AdaCore/e3-core"
license=('GPL')

depends=('python2')
makedepends=('python2-pip')

source=("$pkgname-$pkgver::https://github.com/AdaCore/e3-core/archive/v$pkgver.tar.gz")
sha1sums=('f4ad3415045c5a052f66a66c141cb854b24b291d')

build() {
	cd "e3-core-$pkgver"
}

package() {
	cd "$srcdir/e3-core-$pkgver"
	pip2.7 install --root="$pkgdir" e3-core
}
