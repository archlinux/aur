# Maintainer: François Magimel <magimel.francois at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: rayte <rabyte__gmail>
# Contributor: aldeano <aldea.diaguita at gmail.com>

pkgname=(python-cerealizer python2-cerealizer)
pkgver=0.8.1
pkgrel=3
pkgdesc="A Python module for saving objects in a file"
arch=('any')
url="http://www.lesfleursdunormal.fr/static/informatique/cerealizer/index_en.html"
license=('PSF')
source=(https://pypi.python.org/packages/source/C/Cerealizer/Cerealizer-${pkgver}.tar.bz2)
md5sums=('a77b6215f77c539035ae46a73bfa819e')

package_python-cerealizer() {
  cd "$srcdir/Cerealizer-$pkgver"
  depends=('python')
  
  python setup.py install --root="$pkgdir"
}

package_python2-cerealizer() {
  cd "$srcdir/Cerealizer-$pkgver"
  depends=('python2')
  
  python2 setup.py install --root="$pkgdir"
}
