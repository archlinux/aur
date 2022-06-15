# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-pyxem
pkgshort=pyxem
pkgver=0.14.2
pkgrel=1
pkgdesc="Python library for multi-dimensional diffraction microscopy extending HyperSpy"
arch=('any')
url="https://pyxem.github.io/pyxem-website/"
license=('GPL3')

depends=('python>=3.7'
         'python-dask'
	 'python-diffsims'
         'python-hyperspy>=1.7.0'
         'python-ipywidgets'
	 'python-lmfit>=0.9.12'
         'python-matplotlib>=3.1.1'
	 'python-numba'
	 'python-numpy'
	 'python-orix>=0.3'
	 'python-psutil'
         'python-pyfai'
         'python-scikit-image>=0.17.0'
	 'python-scikit-learn>=0.19'
	 'python-scipy'
	 'python-transforms3d'
         )

makedepends=('python-setuptools' )

provides=('pyxem')

source=(https://github.com/pyxem/pyxem/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('8b0b2f286679eba48a58e7712171ba64')
