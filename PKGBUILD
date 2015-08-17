# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-typicons
pkgver=2.0.4
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Free-to-use vector icons embedded."
arch=('any')
license=("CC BY-SA 3.0")
source=(https://github.com/stephenhutchings/typicons.font/archive/v${pkgver}.zip)
md5sums=('47168ddac4ed5fbea104e58fdea9b8cb')
url="http://typicons.com/"

package() {
  cd "${srcdir}/typicons.font-${pkgver}/src/font"
  install -Dm 644 "typicons.ttf" "${pkgdir}/usr/share/fonts/TTF/typicons.ttf"
}
