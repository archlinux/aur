# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>

pkgname=testoob
pkgver=1.15
pkgrel=2
pkgdesc="Python Testing Out Of (The) Box - An advanced unit testing framework."
arch=('any')
url="http://code.google.com/p/testoob"
license=('Apache')
depends=('python2')
makedepends=('setuptools')
source=('https://pypi.python.org/packages/source/t/testoob/testoob-1.15.tar.bz2'
        'python2.patch')
md5sums=('604d2556ac01ca8f5d189ad8ffe2c8e5'
         'db1313e249d228ba34d9f161a220dd98')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -up1 -i "$srcdir/python2.patch"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
