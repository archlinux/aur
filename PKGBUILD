# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.16
pkgrel=1
pkgdesc='Louvain algorithm for community detection'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python-networkx python-numpy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b7ba2df5002fd28d3ee789a49532baad11fe648e4f2117cf0798e7520a1da56b')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
