# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blue
pkgver=1
pkgrel=1
pkgdesc="Creates table of when the blue hour, the golden hour, or whatever you want occurs"
arch=(any)
url="https://github.com/maandree/blue"
license=('custom:ISC')
depends=(python3 solar-python)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(952c9433425867b0d0e139699a23e2a941e6bd291b474b6d39daba2b6647573b)


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

