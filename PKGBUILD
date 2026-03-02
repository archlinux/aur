# Maintainer: Dae <daedaevibin@naver.com>
pkgname=peguni_draem-la
pkgver=1.0.0
pkgrel=1
pkgdesc="Peguni Draem'la: Whispered Companion - Text-based virtual pet simulator in Lua"
arch=('any')
url="https://github.com/Veridian-Zenith/peguni_draem-la"
license=('0BSD')
depends=('lua')
source=("https://github.com/Veridian-Zenith/peguni_draem-la/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('80d86e24dc065aa8f6fc4f4c4dc31ce5699ab9b6e5655ea2abae9c9320d1a676')

package() {
  install -Dm755 "$srcdir/peguni_draem-la-${pkgver}/virtual_pet.lua" "$pkgdir/usr/bin/peguni-draem-la"
  install -Dm644 "$srcdir/peguni_draem-la-${pkgver}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
