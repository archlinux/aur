# Maintainer: popolon <popolon at popolon.org>
# Contributor: Eric Mikulin 

_name=osmapi
pkgname=python-osmapi
pkgver=4.1.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7b51804f8d0da953376cdfb6f9cfcb79b501312e535b31c654d213d9b46f0270')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
