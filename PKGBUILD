# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='The Leiden algorithm for community detection'
arch=(any)
url="https://github.com/vtraag/$_name"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c1c92c5638ef0ccf67ea89ed311cf19116a82e67bf1a015a3e65f00653a3dc95')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
