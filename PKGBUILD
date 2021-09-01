# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.5.0
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL3')

depends=('python'
         'python-diffsims'
         'python-hyperspy>=1.6.4'
	 'python-h5py>=2.10'
         'python-matplotlib>=3.3'
	 'python-numpy>=1.19'
	 'python-numba>=0.48'
	 'python-orix'
	 'python-pooch'
	 'python-psutil'
	 'python-tqdm'
         'python-scikit-image>=0.16.2'
         'python-scikit-learn'
         'python-scipy'
         )

makedepends=('python-setuptools' )

provides=('kikuchipy')

source=(https://github.com/pyxem/kikuchipy/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('0434c186889ce9e3fc2e738a2b5020b2')
