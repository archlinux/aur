# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=rawk
pkgver=1.0
pkgrel=4
pkgdesc="A static site generator written in the bourne shell."
arch=(any)
url="http://rawk.brokenlcd.net"
license=('ISC')
source=(http://downloads.sourceforge.net/project/rawk-sh/$pkgname-$pkgver.tgz)
sha256sums=('3c0818f582e448d4ff5a9340da2387baea558ac15f1aa2bc57dc1490405285d2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  make PREFIX="$pkgdir/usr" USER=nobody GROUP=users
}

# vim:set ts=2 sw=2 et:
