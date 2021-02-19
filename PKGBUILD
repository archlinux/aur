# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blue
pkgver=1.1
pkgrel=1
pkgdesc="Creates table of when the blue hour, the golden hour, or whatever you want occurs"
arch=(any)
url="https://github.com/maandree/blue"
license=('custom:ISC')
depends=(python3 solar-python)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(6070e151b07753b218f423cb07b09e2f8493b4e57470dc3a068ec035dd11d789)


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

