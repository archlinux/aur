# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.7.0
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
	 'python-numpy'
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

md5sums=('34f94e670443d96ccf2bf71243bbc125')
