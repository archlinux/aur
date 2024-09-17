# Maintainer: popolon <popolon at popolon.org>
# Contributor: Eric Mikulin 

_name=osmapi
pkgname=python-osmapi
pkgver=4.2.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eef8aff6dfedfda41e523859c6d4e9cd1b5b91943354b76564b63fc4c299c22f')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
