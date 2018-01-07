# $Id: PKGBUILD 195829 2016-11-14 17:35:56Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: mathieui <mathieui(AT)mathieui(DOT)net>
# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=python2-ipy
pkgver=0.83
pkgrel=1
pkgdesc="Python class and tools for handling of IPv4 and IPv6 addresses and networks."
arch=('any')
url="https://pypi.python.org/pypi/IPy"
license=('BSD')
depends=('python2')
source=(https://cheeseshop.python.org/packages/source/I/IPy/IPy-$pkgver.tar.gz)
sha256sums=('61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8')

package() {
  cd "$srcdir/IPy-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/IPy-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
