# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.11
pkgrel=1
pkgdesc='Louvain algorithm for community detection'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ce7143f8d2bb4693a84dc0046dbf94dc576c9f6030f518f73c4420bfb2a442a')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
