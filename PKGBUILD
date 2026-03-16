# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
url="https://github.com/christo-auer/eilmeldung"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=( )  
conflicts=( 'eilmeldung' 'eilmeldung-git' )
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/eilmeldung-$arch-unknown-linux-musl-$pkgver.tar.gz")
sha256sums=('6fb0f166b4b3aec6245597ed8974aaae29c77ccf87652ebb75f10a02ace190e8')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

