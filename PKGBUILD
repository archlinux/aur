# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=amethyst-prerequisites
pkgver=0.0.0
pkgrel=0
pkgdesc="Required dependencies to build Amethyst game engine"
arch=(any)
license=(MIT)
url='https://github.com/KSXGitHub/amethyst-prerequisites.pkgbuild'
depends=(grep gcc pkgconfig openssl alsa-lib cmake make python3 freetype2 awk libxcb)
source=(LICENSE.md)
sha512sums=(SKIP)

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
