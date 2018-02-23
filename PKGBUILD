# Maintainer: Philipp A. <flying-sheep@web.de>

_name=louvain
pkgname=python-$_name-igraph
pkgver=0.6.1
pkgrel=1
pkgdesc='Louvain algorithm for community detection (for use with python-igraph)'
arch=(any)
url="https://github.com/vtraag/$_name-igraph"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ffd83318e44e62e24d3cb7f159c0ff13382edafb956a8169cedd2c79b66b6968')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
