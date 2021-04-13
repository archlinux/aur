# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-dark
_pkgname=Sweet-Dark
pkgrel=1
pkgver=2.0

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/${pkgver}/${_pkgname}.tar.xz)
md5sums=('f748294586c27156e7ef205d83f8ac6d')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
