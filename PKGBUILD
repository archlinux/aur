# Maintainer: Philipp A. <flying-sheep@web.de>

_name=louvain
pkgname=python-$_name-igraph
pkgver=0.7.1
pkgrel=1
pkgdesc='Louvain algorithm for community detection (for use with python-igraph)'
arch=(any)
url="https://github.com/vtraag/$_name-igraph"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3dbb2b36fb4378370b92d6fd51484576f830bf38478ba58bd5e5725015a38990')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
