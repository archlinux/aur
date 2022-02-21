# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.8.2
pkgrel=1
pkgdesc="Python library for analysing orientations and crystal symmetry."
arch=('any')
url="https://orix.rtfd.io/"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-diffpy.structure>=3'
	 'python-h5py'
         'python-matplotlib>=3.3'
	 'python-matplotlib-scalebar'
         'python-numba'
	 'python-numpy'
	 'python-numpy-quaternion'
         'python-scipy'
	 'python-tqdm'
         )

makedepends=('python-setuptools' )

provides=('orix')

source=(https://github.com/pyxem/orix/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('e417dd880daac2a5f6ad6d2f5cbff650')
