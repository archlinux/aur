# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=( 'eilmeldung' 'eilmeldung-git' )
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/eilmeldung-x86_64-unknown-linux-gnu-$pkgver.tar.gz")
sha256sums=('19c056d65eea01a740f828bc3411057cdd15ba6ea457df96856c9298fa08054e')
arch=('x86_64')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

