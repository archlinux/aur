# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=amaranth-font
_gitname=amaranth
pkgver=1.0.0
pkgrel=5
pkgdesc="A friendly upright italic design with a slight contrast and distinctive curves"
arch=('any')
url="https://fonts.google.com/specimen/Amaranth"
license=('custom:OFL')
makedepends=(
  git
)
source=(
  amaranth::git+https://github.com/googlefonts/amaranth
)
sha256sums=(
  SKIP
)

package () {
  cd "$srcdir/$_gitname"
  install -Dm 644 fonts/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/amaranth/"
  install -Dm 644 "OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
