# Contributor: <grawity@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>

pkgname=nocache
pkgver=1.2
pkgrel=1
pkgdesc="minimize caching effects"
arch=(i686 x86_64)
url="https://github.com/Feh/nocache"
license=('FreeBSD License')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Feh/nocache/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('2f8c6adbc82da4477416e1eaf9d435cf52f602d07064602f433d4ba4ecad5fdd')


build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
