# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.8.2
pkgrel=1
pkgdesc='The Leiden algorithm for community detection'
arch=(any)
url="https://github.com/vtraag/$_name"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02cc8e87d2000ea1da60e9efc9287764fe81e445ab9850ec728b006c37620289')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
