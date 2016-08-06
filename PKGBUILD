# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcoopgamma
pkgver=1.0
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcoopgamma"
license=('GPL3')
depends=(coopgammad)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(6ddba2419c717557283bcf60b5ab834475cf60fea442cf54f7bbc806d6ef6fbf)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

