# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bus
pkgver=3.1.1
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('MIT')
depends=()
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(968e0d17dbab55999fb2caff0dd056d2ae46bbd62be93c21df8eefb7732bcfb1)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

