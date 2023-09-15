# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=mapbox-polylabel
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast algorithm for finding the pole of inaccessibility of a polygon"
arch=('any')
url="https://github.com/mapbox/polylabel"
license=('ISC')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/polylabel/archive/v${pkgver}.tar.gz")
sha256sums=('3694a3127954fab760686c825e2e585684934c768b5f9d542b8701e54147f1a8')

package() {
  install -dm755 "$pkgdir"/usr/include/mapbox "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/include/mapbox/*.hpp "$pkgdir"/usr/include/mapbox/

  # License
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
