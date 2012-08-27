# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=pgxnclient
pkgver=1.1
pkgrel=1
pkgdesc="Command line tool to interact with the PostgreSQL Extension Network"
arch=(any)
url="http://pgxn.org/"
license=('BSD')
depends=('python2' 'python2-distribute')
conflicts=('pgxn-client')
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  return 0
}
package() {
  cd $srcdir/$pkgname-$pkgver/
  python2 setup.py install --root=$pkgdir

  install -d -m755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/"
}
md5sums=('2fae0a02101a0e7ddc0b0674c865bffa')
