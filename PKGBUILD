# Maintainer: popolon <popolon at popolon.org>
# Contributor: Eric Mikulin 

_name=osmapi
pkgname=python-osmapi
pkgver=4.0.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f2a65d5ae9d4b582393f858e6d9b75f83183689a0678f85251d72bd6cb36c144')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
