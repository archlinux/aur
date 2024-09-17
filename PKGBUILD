# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.13.0
pkgrel=1
pkgdesc="Python library for analysing orientations and crystal symmetry."
arch=('any')
url="https://orix.rtfd.io/"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-diffpy.structure>=3.0.2'
	 'python-h5py'
         'python-matplotlib>=3.5'
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

md5sums=('ede49b64fd2007d912bc311752f17916')
