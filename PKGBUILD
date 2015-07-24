# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=darcsver
pkgver=1.7.4
pkgrel=2
pkgdesc="generate a version number from darcs history"
arch=('any')
url='http://allmydata.org/trac/darcsver'
license=('BSD')
depends=('python2')
makedepends=('python2-mock' 'python2-distribute')
source=( http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz )
md5sums=('e38aecd1343ab8447888a479ab12cb59')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
