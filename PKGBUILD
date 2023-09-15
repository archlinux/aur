# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=mapbox-geometry.hpp
pkgver=2.0.3
pkgrel=1
pkgdesc="C++ geometry types"
arch=('any')
url="https://github.com/mapbox/geometry.hpp"
license=('ISC')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/geometry.hpp/archive/v${pkgver}.tar.gz")
sha256sums=('9d750d34576069bcc4f39677af08cde2862fbe4b8c0d9af504877c2fae2ae273')

package() {
  install -dm755 "$pkgdir"/usr/include/mapbox "$pkgdir"/usr/include/mapbox/geometry "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 "$srcdir"/geometry.hpp-"$pkgver"/include/mapbox/*.hpp "$pkgdir"/usr/include/mapbox/
  install -Dm644 "$srcdir"/geometry.hpp-"$pkgver"/include/mapbox/geometry/*.hpp "$pkgdir"/usr/include/mapbox/geometry/

  # License
  install -Dm644 "$srcdir"/geometry.hpp-"$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
