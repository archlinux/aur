# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.6.1
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr'
license=(MIT)
depends=(python-fasteners python-asciitree python-numpy python-numcodecs)
makedepends=(python-setuptools-scm)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa7eac1e4ff47ff82d09c42bb4679e18e8a05a73ee81ce59cee6a441a210b2fd')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
