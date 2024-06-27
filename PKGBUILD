# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=mapbox-polylabel
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast algorithm for finding the pole of inaccessibility of a polygon"
arch=('any')
url="https://github.com/mapbox/polylabel"
license=('ISC')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/polylabel/archive/v${pkgver}.tar.gz")
sha256sums=('9aba4320c6cb5a8e9a8d44feb0d68b79b3127bdcb759a26aca92ac637668d7b9')

package() {
  install -dm755 "$pkgdir"/usr/include/mapbox "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/include/mapbox/*.hpp "$pkgdir"/usr/include/mapbox/

  # License
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
