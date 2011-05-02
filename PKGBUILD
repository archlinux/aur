# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=pgxnclient
pkgver=0.1a4
pkgrel=1
pkgdesc="Command line tool to interact with the PostgreSQL Extension Network"
arch=(any)
url="http://pgxn.org/"
license=('BSD')
depends=('python2')
conflicts=('pgxn-client')
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver/
  python2 setup.py install --root=$pkgdir

  install -d -m755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/"
}
md5sums=('ccb91678794943f1ebd993e6e55ed2de')
