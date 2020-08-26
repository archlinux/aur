# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-dark
_pkgname=Sweet-Dark
pkgrel=1
pkgver=1.10.5

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/v${pkgver}/${_pkgname}.zip)
md5sums=('d81ded10c05e936a7d62ec0dc088a4bd')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
