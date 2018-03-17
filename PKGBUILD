_name=osmapi
pkgname=python-osmapi
pkgver=1.1.0
pkgrel=1
pkgdesc='Python wrapper for the OSM API'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ad6c6df2e2727db82ad67560f420f67eb9e96408e1838962ceb131fb7267eff')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
