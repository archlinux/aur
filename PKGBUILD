# Maintainer: Popolon <popolon(At)popolon.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mathieui <mathieui(AT)mathieui(DOT)net>
# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=python2-ipy
pkgver=1.01
pkgrel=1
pkgdesc="Python class and tools for handling of IPv4 and IPv6 addresses and networks."
arch=('x86_64' 'i686' 'pentium4')
url="https://pypi.python.org/pypi/IPy"
license=('BSD')
depends=('python2')
source=(https://cheeseshop.python.org/packages/source/I/IPy/IPy-$pkgver.tar.gz)
sha256sums=('edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a')

package() {
  cd "$srcdir/IPy-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/IPy-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
