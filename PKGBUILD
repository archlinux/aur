# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-ambar
_pkgname=Sweet-Ambar
pkgrel=1
pkgver=1.10.5

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/v${pkgver}/${_pkgname}.zip)
md5sums=('fdf4dd3f5bbefa645d3f1f49ae57fcaf')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
