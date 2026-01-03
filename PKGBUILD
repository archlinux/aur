# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
url="https://github.com/christo-auer/eilmeldung"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=( )  
conflicts=( 'eilmeldung' 'eilmeldung-git' )
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/eilmeldung-$arch-unknown-linux-musl-$pkgver.tar.gz")
sha256sums=('57abf277f87eb2267ba4b20edc21dd31088614869b9c624fc502ceebc01c6c81')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

