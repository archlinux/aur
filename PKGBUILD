# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-pyxem
pkgshort=pyxem
pkgver=0.15.1
pkgrel=2
pkgdesc="Python library for multi-dimensional diffraction microscopy extending HyperSpy"
arch=('any')
url="https://pyxem.github.io/pyxem-website/"
license=('GPL3')

depends=('python>=3.7'
         'python-dask'
	 'python-diffsims>=0.5'
         'python-hyperspy>=1.7.0'
         'python-ipywidgets'
	 'python-lmfit>=0.9.12'
         'python-matplotlib>=3.3'
	 'python-numba'
	 'python-numpy'
	 'python-orix>=0.9'
	 'python-psutil'
         'python-pyfai'
         'python-scikit-image>=0.19.0'
	 'python-scikit-learn>=1.0'
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

md5sums=('6e7e03dfe519e4d2311116d3bd8ac5e7')
