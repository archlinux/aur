# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.11.1
pkgrel=1
pkgdesc="Python library for analysing orientations and crystal symmetry."
arch=('any')
url="https://orix.rtfd.io/"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-diffpy.structure>=3.0.2'
	 'python-h5py'
         'python-matplotlib>=3.3'
	 'python-matplotlib-scalebar'
         'python-numba'
	 'python-numpy'
	 'python-numpy-quaternion'
	 'python-pooch>=0.13'
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

md5sums=('3c3db15f03a669147954f54332f84ce2')
