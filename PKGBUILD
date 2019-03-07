# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.13
pkgrel=1
pkgdesc='Louvain algorithm for community detection'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python-networkx python-numpy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b4938f20063bc53e68d5b182dcea0634dfb63a0e3489f929d4083c24a920b2fe')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
