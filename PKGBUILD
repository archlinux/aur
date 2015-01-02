# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python2-processing
_pythonname=processing
pkgver=0.52
pkgrel=1
pkgdesc="Package for using processes which mimics the threading module"
url="https://pypi.python.org/pypi/processing"
arch=('any')
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/p/processing/${_pythonname}-${pkgver}.zip")
md5sums=('62772fa3002d003b2395ed669072d51d')

PYTHON='python2'

package() {
  cd $srcdir/${_pythonname}-${pkgver}
  $PYTHON setup.py install --prefix=/usr --root=$pkgdir
  install -D -m 644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
