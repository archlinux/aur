# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=haiku-icon-theme
pkgver=0.7
pkgrel=1
pkgdesc="Icon theme ported from Haiku OS"
arch=('any')
url="https://www.gnome-look.org/p/1012423"
_repo='https://github.com/tallero/haiku-icon-theme'
license=('MIT')
depends=('gtk-update-icon-cache')
makedepends=('git')
source=("${pkgname}::git+${_repo}")
b2sums=('SKIP')

package() {
  _srcdir="${srcdir}/${pkgname}/Haiku"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}" "${_output}/icons"
  cp -r "${_srcdir}" "${_output}/icons"
}
