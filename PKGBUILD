# $Id$
# Maintainer: Kemad Zhong <kemadz@gmail.com>

pkgname=tcping-git
pkgver=1.3.5
pkgrel=1
pkgdesc="a utility that does a TCP connect to the given ip/port combination"
url="https://github.com/mkirchner/tcping"
license=("LGPL")
arch=('x86_64')
depends=('glibc')
source=("git+https://github.com/mkirchner/tcping")
sha512sums=('SKIP')

build() {
  cd "$srcdir/tcping"
  make
}

package() {
  install -Dm 755 "$srcdir/tcping/tcping" "$pkgdir/usr/bin/tcping"
}
