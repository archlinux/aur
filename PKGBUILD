# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=alacritty-theme
pkgver=0.0.1
pkgrel=1
pkgdesc="Collection of Alacritty color schemes."
arch=('any')
url="https://github.com/eendroroy/alacritty-theme"
license=('apache')
depends=('alacritty')
source=("${pkgname}::git+${url}")
b2sums=('SKIP')

package() {
  _srcdir="${srcdir}/${pkgname}/themes"
  _output="${pkgdir}/usr/share/alacritty"
  install -dm755 "${_srcdir}" "${_output}"
  cp -r "${_srcdir}" "${_output}"
}
