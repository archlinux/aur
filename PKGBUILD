# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Michael Blum <michaeldblum@earthlink.net>
pkgname=xd
pkgver=1
pkgrel=3
pkgdesc='a utility for dumping files in hex, decimal, or octal'
arch=('i686' 'x86_64')
url="http://www.fourmilab.ch/xd"
license=('custom')
depends=()
makedepends=(gcc)
source=("http://www.fourmilab.ch/$pkgname/$pkgname.zip" 'COPYING')
options=('zipman')
md5sums=('304184cb2bd79900c4750dcab481033a'
         '5cf61120e8516a804a13731920518974')

build() {
  cd $srcdir/
  make
}
package() {
  install -Dm755 xd $pkgdir/usr/bin/xd
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  install -Dm644 xd.1 $pkgdir/usr/share/man/man1/xd.1
}

# vim:set ts=2 sw=2 et:
