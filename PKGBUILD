# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.6.0
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL3')

depends=('python'
	 'python-dask>=2021.8.1'
         'python-diffsims>=0.4'
         'python-hyperspy>=1.7'
	 'python-h5py>=2.10'
         'python-matplotlib>=3.3'
	 'python-numpy>=1.19'
	 'python-numba>=0.48'
	 'python-orix>=0.9'
	 'python-pooch>=0.13'
	 'python-psutil'
	 'python-tqdm>=0.5.2'
         'python-scikit-image>=0.16.2'
         'python-scikit-learn'
         'python-scipy>=1.7'
         )

makedepends=('python-setuptools' )

optdepends=('python-pyvista: visualization')

provides=('kikuchipy')

source=(https://github.com/pyxem/kikuchipy/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('74a74198af55b18330e6f8a6fb59eb37')
