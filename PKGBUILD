# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
url="https://github.com/christo-auer/eilmeldung"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=( )  
conflicts=( 'eilmeldung' 'eilmeldung-git' )
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/eilmeldung-$arch-unknown-linux-musl-$pkgver.tar.gz")
sha256sums=('71ae161183a854c994f73ea43d6db5203e82c3ab17702e0105837c0fc0c600a8')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

