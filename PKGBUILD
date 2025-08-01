# Maintainer: Dae <daedaevibin@naver.com>
pkgname=peguni_draem-la
pkgver=0.1.9b
pkgrel=2
pkgdesc="Peguni Draem'la: Whispered Companion - Text-based virtual pet simulator in Lua"
arch=('any')
url="https://github.com/Veridian-Zenith/peguni_draem-la"
license=('0BSD')
depends=('lua')
source=("https://github.com/Veridian-Zenith/peguni_draem-la/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('332442e3ea295a8668e30f0d99b821b7017cd6948803893a4d508a03cb2f8961')

package() {
  install -Dm755 "$srcdir/peguni_draem-la-${pkgver}/virtual_pet.lua" "$pkgdir/usr/bin/peguni-draem-la"
  install -Dm644 "$srcdir/peguni_draem-la-${pkgver}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
