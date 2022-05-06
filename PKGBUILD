# Maintainer: Popolon <popolon(At)popolon.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mathieui <mathieui(AT)mathieui(DOT)net>
# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=python2-ipy
pkgver=1.00
pkgrel=1
pkgdesc="Python class and tools for handling of IPv4 and IPv6 addresses and networks."
arch=('i686' 'pentium4' 'x86_64')
url="https://pypi.python.org/pypi/IPy"
license=('BSD')
depends=('python2')
source=(https://cheeseshop.python.org/packages/source/I/IPy/IPy-$pkgver.tar.gz)
sha256sums=('2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621')

package() {
  cd "$srcdir/IPy-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/IPy-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
