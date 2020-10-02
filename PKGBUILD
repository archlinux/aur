# Maintainer: Philipp A. <flying-sheep@web.de>
_name=loompy
pkgname=python-loompy
pkgver=3.0.6
pkgrel=1
pkgdesc='Python implementation of the Loom file format for single-cell RNA-seq data'
arch=(any)
url='http://loompy.org/'
license=(BSD)
depends=(
	python-h5py
	python-scipy
	python-numpy
	python-numba
	python-click
	python-numpy-groupies
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('58e9763b8ab1af2a4a0e3805d120458b5184fd2b0f3031657ecce33c63ca4c46')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
