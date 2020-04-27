# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.8.0
pkgrel=1
pkgdesc='The Leiden algorithm for community detection'
arch=(any)
url="https://github.com/vtraag/$_name"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ebab74ce92615b614bef9ec36a7318c45db928bd795ed262c4a10f4d009196ef')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
