# Maintainer: Philipp A. <flying-sheep@web.de>
_name=loompy
pkgname=python-loompy
pkgver=1.1.0
pkgrel=1
pkgdesc='Python implementation of the Loom file format for single-cell RNA-seq data'
arch=(any)
url='http://loompy.org/'
license=(BSD)
depends=(python-h5py python-scipy python-numpy)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('85ec1d9424fdfe55a4e11b7dca0785eb')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
