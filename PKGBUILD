# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-ambar-blue
_pkgname=Sweet-Ambar-Blue
pkgrel=1
pkgver=1.10.5

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/v${pkgver}/${_pkgname}.zip)
md5sums=('d22354d4d3ea84e53b1fb8a6b5147f3c')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
