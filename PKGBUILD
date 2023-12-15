# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-rosettasciio
pkgshort=rosettasciio
pkgver=0.3
pkgrel=3
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

source=(https://files.pythonhosted.org/packages/source/r/$pkgshort/$pkgshort-$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('22d3f5cb2182f1e79566e612e52343f2')
