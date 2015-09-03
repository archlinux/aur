# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=shr
pkgver=1.0
pkgrel=1
pkgdesc="Shared memory with n-fold bufferings zero-copy data streaming"
arch=(i686 x86_64)
url="https://github.com/maandree/shr"
license=('MIT')
depends=()
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e35dcbcb12942e93d022b3baaf591278c3b6aa7e8ea349429fd6e45c9db71647)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

