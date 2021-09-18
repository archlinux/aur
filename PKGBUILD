# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blue
pkgver=1.1.1
pkgrel=1
pkgdesc="Creates table of when the blue hour, the golden hour, or whatever you want occurs"
arch=(any)
url="https://github.com/maandree/blue"
license=('custom:ISC')
depends=(python3 solar-python)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1d41cf95ecadc6ca9997a89fe55668b1bf68f84b1b259df91987e6fe22c545e5)


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
