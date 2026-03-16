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
sha256sums=('37e15b3f7af036155ec172d1676cbec705f858f5776278be802b2aa998c0ceac')


package() {
  cd "$srcdir"
  install -Dm755 eilmeldung/eilmeldung "$pkgdir/usr/bin/eilmeldung"
}

# vim:set ts=2 sw=2 et:

