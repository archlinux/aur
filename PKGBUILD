# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcolour
pkgver=2.3
pkgrel=1
pkgdesc="A C colour space library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcolour"
license=('ISC')
depends=(glibc)
makedepends=(glibc make coreutils gcc sed python)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f207e89386db4056cf3cb7f3335adea59b433ae2b78f11dc2b4c79bdae6bb9d0)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

