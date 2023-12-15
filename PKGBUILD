# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-rosettasciio
pkgshort=rosettasciio
pkgver=0.3
pkgrel=2
pkgdesc="Rosetta Scientific Input Output library"
arch=('any')
url="http://hyperspy.org/rosettasciio"
license=('GPL3')

depends=('python'
         'python-dateutil'
	 'python-h5py>=2.3'
	 'python-imageio>=2.16'
	 'python-numba>=0.52'
         'python-numpy>=1.20.0'
         'python-pint>=0.8'
         'python-box>=6'
         'python-pyaml'
         'python-scipy>=1.5.0'
    	 'python-sparse'
         )

makedepends=('python-setuptools' )

provides=('rsciio')

source=(https://github.com/hyperspy/rosettasciio/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('384f3a956f6f4ff3705ab668953dca1c')
