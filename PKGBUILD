# Maintainer: Eli W. Hunter <hunter.eli.w@gmail.com>
# Contributor: Steef Hegeman <steefhegeman@hotmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-typicons
pkgver=2.0.9
pkgrel=2
pkgdesc="336 pixel perfect, all-purpose vector icons in a web-font kit"
arch=('any')
license=("CC BY-SA 3.0")
source=(https://github.com/stephenhutchings/typicons.font/archive/v${pkgver}.tar.gz)
md5sums=('4c434d77a88e7bad125faa1f49bd0283')
url="http://typicons.com/"

package() {
  cd "${srcdir}/typicons.font-${pkgver}/src/font"
  install -Dm 644 "typicons.ttf" "${pkgdir}/usr/share/fonts/TTF/typicons.ttf"
}
