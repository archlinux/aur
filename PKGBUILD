# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=('python-twiggy' 'python2-twiggy')
pkgver=0.4.7
pkgrel=1
pkgdesc="trac xmlrpc library"
arch=(any)
url="http://twiggy.wearpants.org/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.org/packages/source/t/twiggy/Twiggy-$pkgver.tar.gz)

package_python-twiggy() {
  cd $srcdir/Twiggy-$pkgver

  python setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-twiggy() {
  cd $srcdir/Twiggy-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('4d363a8d6b966b7ec617a08bf129f2b9')
