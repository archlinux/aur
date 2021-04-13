# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-theme-ambar-blue
_pkgname=Sweet-Ambar-Blue
pkgrel=1
pkgver=2.0

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/${pkgver}/${_pkgname}.tar.xz)
md5sums=('88284687cb7838b5d06898d9e548cea5')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
