# Maintainer: Dominik Mayer <dominik.mayer@gmail.com>
# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Bjorn Michelsen <bjorn@bmichelsen.no>
# Contributor: David Hajage <dhajage@gmail.com>

pkgname=etm
pkgver=891
pkgrel=3
pkgdesc="Manage events and tasks using simple text files"
arch=('any')
url="http://www.duke.edu/~dgraham/ETM/"
license=('GPL')
depends=('python2' 'python2-distribute' 'python2-dateutil' 'wxpython')
makedepends=('setuptools')
source=(http://www.duke.edu/~dgraham/ETM/$pkgname-$pkgver.tar.gz)
md5sums=('4e4cd162a9103debc2596401a1acfaae')

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir 
}
