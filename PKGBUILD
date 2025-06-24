# Maintainer: popolon <popolon at popolon.org>
# Contributor: Eric Mikulin 

_name=osmapi
pkgname=python-osmapi
pkgver=4.3.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('85f1ac9dd77aac7c8b2a7b4ef5cf4e29b48e915cfe8f11718ed152d38322ca43')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
