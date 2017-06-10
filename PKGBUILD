# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcolour
pkgver=2.0
pkgrel=1
pkgdesc="A C colour space library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcolour"
license=('ISC')
depends=(glibc)
makedepends=(glibc make coreutils gcc)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a113cca035cf1c0b34ce611b316ac0582368adf9100e964a592d58c0210e5602)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

