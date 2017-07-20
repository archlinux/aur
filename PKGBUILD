# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.8
pkgrel=1
pkgdesc='Python library for validating Python data structures.'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7cdc7bcb6a8b2f5599b4826315b84bc390b4f964b644cdef781fb7e0ebf4c006')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
