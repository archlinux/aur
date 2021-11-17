# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.5.4
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL3')

depends=('python'
         'python-diffsims>=0.4'
         'python-hyperspy>=1.6.5'
	 'python-h5py>=2.10'
         'python-matplotlib>=3.3'
	 'python-numpy>=1.19'
	 'python-numba>=0.48'
	 'python-orix>=0.7'
	 'python-pooch>=0.13'
	 'python-psutil'
	 'python-tqdm>=0.5.2'
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

md5sums=('b67e37f1c5438b63a42a3ac642475202')
