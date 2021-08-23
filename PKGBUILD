# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-pyxem
pkgshort=pyxem
pkgver=0.13.3
pkgrel=1
pkgdesc="Python library for multi-dimensional diffraction microscopy extending HyperSpy"
arch=('any')
url="https://pyxem.github.io/pyxem-website/"
license=('GPL3')

depends=('python>=3.7'
         'python-scikit-image>=0.17.0'
         'python-matplotlib>=3.1.1'
         'python-hyperspy>=1.6.2'
	 'python-diffsims'
	 'python-lmfit>=0.9.12'
	 'python-pyfai'
	 'python-ipywidgets'
	 'python-numba'
	 'python-orix>=0.3'
	 'python-silx'
         )

makedepends=('python-setuptools' )

provides=('pyxem')

source=(https://github.com/pyxem/pyxem/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('f3292b1a7eb3ab624796b352b585e4b6')
