# Maintainer: popolon <popolon at popolon.org>
# Contributor: Eric Mikulin 

_name=osmapi
pkgname=python-osmapi
pkgver=5.0.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('244b0fb432f7810a38b38a13eacc6d53df5441a1ea02a5e952b0fb1c44f2a420')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
