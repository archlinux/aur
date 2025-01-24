# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-pyxem
pkgshort=pyxem
pkgver=0.20.0
pkgrel=1
pkgdesc="Python library for multi-dimensional diffraction microscopy extending HyperSpy"
arch=('any')
url="https://pyxem.github.io/pyxem-website/"
license=('GPL3')

depends=('python>=3.7'
         'python-dask'
	 'python-diffsims>=0.6'
         'python-hyperspy>=2.0'
	 'python-h5py'
	 'python-lmfit>=0.9.12'
         'python-matplotlib>=3.7.5'
	 'python-numba'
	 'python-numpy'
	 'python-orix>=0.12.1'
         'python-pooch'
	 'python-psutil'
         'python-pyfai'
         'python-scikit-image>=0.22.0'
	 'python-scikit-learn>=1.0'
	 'python-scipy'
	 'python-shapely>2.0.0'
         'python-silx'
         'python-tqdm'
         'python-traits'
	 'python-transforms3d'
         'python-zarr'
         )

makedepends=('python-setuptools' )

provides=('pyxem')

source=(https://github.com/pyxem/pyxem/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('49c6f72135ea86d4d8f0759e41e2b6d9')
