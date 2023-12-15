# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-pyebsdindex
pkgshort=PyEBSDIndex
pkgver=0.2.0
pkgrel=3
pkgdesc="Python based tool for Radon based EBSD orientation indexing."
arch=('any')
url="https://pyebsdindex.readthedocs.io"
license=('Custom')

depends=('python>=3.7'
	 'python-h5py>=2.10'
         'python-matplotlib'
	 'python-numpy'
	 'python-numba'
         'python-scipy'
         )

makedepends=('python-setuptools' )

optdepends=( )

provides=('pyebsdindex')

source=(https://github.com/USNavalResearchLaboratory/PyEBSDIndex/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


md5sums=('5aa5913980ab370a5a830f9e6fb044aa')
