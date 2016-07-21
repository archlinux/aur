# $Id: PKGBUILD 134052 2015-05-25 12:02:54Z spupykin $
# Maintainer: orumin <dev@orum.in>

pkgname=python2-junos-eznc
pkgver=1.3.1
pkgrel=1
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://pypi.python.org/pypi/IPy"
license=('Apache')
depends=('python2')
source=(https://github.com/Juniper/py-junos-eznc/archive/1.3.1.tar.gz)
md5sums=('f2c0687d5cfbad35dbd393184dc10c1c')

package() {
  cd "$srcdir/py-junos-eznc-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -D -m644 $srcdir/py-junos-eznc-$pkgver/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
