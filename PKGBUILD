# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=blue
pkgver=1.1.2
pkgrel=1
pkgdesc="Creates table of when the blue hour, the golden hour, or whatever you want occurs"
arch=(any)
url="https://codeberg.org/maandree/blue"
license=('custom:ISC')
depends=(python3 solar-python)
makedepends=()
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(77aaf03d0374a0fff1e3290cc8492ef9f48ccf8517b411396a90f83ff1c162a9)


package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
