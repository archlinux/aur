# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcolour
pkgver=2.1
pkgrel=1
pkgdesc="A C colour space library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcolour"
license=('ISC')
depends=(glibc)
makedepends=(glibc make coreutils gcc)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(cf8aa366267066bd3f84c99777ba4e3a8264c62fb1f5e5ee578d5e3bbf4c4c89)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

