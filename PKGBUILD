# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.10.3
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr-python'
license=(MIT)
depends=(python-asciitree python-numpy python-fasteners 'python-numcodecs>=0.6.4')
makedepends=(python-setuptools-scm)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('76932665c2146ebdf15f6dba254f9e0030552fbfcf9322dea822bff96fbce693')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
