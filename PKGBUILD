# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-typicons
pkgver=2.0.8
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Free-to-use vector icons embedded."
arch=('any')
license=("CC BY-SA 3.0")
source=(https://github.com/stephenhutchings/typicons.font/archive/${pkgver}.tar.gz)
md5sums=('2402605eb15c7f8e63ab5cedb49b530f')
url="http://typicons.com/"

package() {
  cd "${srcdir}/typicons.font-${pkgver}/src/font"
  install -Dm 644 "typicons.ttf" "${pkgdir}/usr/share/fonts/TTF/typicons.ttf"
}
