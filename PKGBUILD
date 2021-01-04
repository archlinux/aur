# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.14
pkgrel=1
pkgdesc='Louvain algorithm for community detection'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python-networkx python-numpy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e0a50c7a1e87b45410cd2a1d6298268862e55edaa46f90ae6b834bbb62df0951')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
