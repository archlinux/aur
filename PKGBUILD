# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>

pkgname=sweet-theme-mars
_pkgname=Sweet-mars
pkgrel=1
pkgver=2.0

pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/EliverLara/Sweet'
arch=('any')
license=('GPL3')

source=(https://github.com/EliverLara/Sweet/releases/download/${pkgver}/${_pkgname}.tar.xz)
md5sums=('b0337c3d59b6bba19a840bf45810a14c')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes"
}
