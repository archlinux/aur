# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
url="https://github.com/christo-auer/eilmeldung"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=( )  
conflicts=( 'eilmeldung' 'eilmeldung-git' )
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/eilmeldung-$arch-unknown-linux-musl-$pkgver.tar.gz")
sha256sums=('b52edbb40c950e88385a751a089037fb07c3345bca6ab66c680a1f7271ed68cc')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

