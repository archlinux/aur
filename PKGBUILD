# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=python-louvain
pkgver=0.15
pkgrel=1
pkgdesc='Louvain algorithm for community detection'
arch=(any)
url="https://github.com/taynaud/$pkgname"
license=(BSD)
depends=(python-networkx python-numpy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2a856edfbe29952a60a5538a84bb78cca18f6884a88b9325e85a11c8dd4917eb')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
