# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bus
pkgver=3.1.5
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('MIT')
depends=()
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(ddf0d00e30459a0e33bd90a2cb8c627c5b87216debd834ceb181435a2747cc42)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

