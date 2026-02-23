# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=blue
pkgver=1.1.3
pkgrel=1
pkgdesc="Creates table of when the blue hour, the golden hour, or whatever you want occurs"
arch=(any)
url="https://codeberg.org/maandree/blue"
license=('custom:ISC')
depends=(python3 solar-python)
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fc92b050f09f81623df5e78a9d00a4a1d737f5e84428d2de2454998ec5601bdc)


package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
