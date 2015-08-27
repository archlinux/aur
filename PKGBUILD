# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bus
pkgver=3.1.2
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('MIT')
depends=()
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(75bf9c7b3f1792d6ceced53b57b6a54b50e86aa98df0aa846e316110c08e5208)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

