# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-mars
_pkgname=Sweet-mars
pkgrel=1
pkgver=1.10.5

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/v${pkgver}/${_pkgname}.zip)
md5sums=('477182eb023a1854e6210e3829dbead7')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
