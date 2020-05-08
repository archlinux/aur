# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=python-py-radix
pkgver=0.10.0
pkgrel=1
pkgdesc="Implements the radix tree data structure"
arch=('x86_64')
url="https://github.com/mjschultz/py-radix"
license=(BSD)
depends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('13eb2b0b228973c8fe79370db0d8c14ad74965ed8491d347483792cb20b8453b')

package() {
	cd "$srcdir/py-radix-$pkgver"
	python setup.py install -O2 --root="$pkgdir"
}
