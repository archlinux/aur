# Maintainer: Philipp A. <flying-sheep@web.de>

_name=louvain
pkgname=python-$_name-igraph
pkgver=0.5.3
pkgrel=1
pkgdesc='Louvain algorithm for community detection (for use with python-igraph)'
arch=(any)
url="https://github.com/vtraag/$_name-igraph"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('640a6728066df822f1228cfb028e9648c4d516bbdb07a92d3159a810fb975f95')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
