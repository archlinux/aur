# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme-dark
_pkgname=Sweet-Dark
pkgver=2.0
pkgrel=2
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme-dark')
replaces=('sweet-theme-dark')
source=("$url/releases/download/${pkgver}/${_pkgname}.tar.xz")
md5sums=('f748294586c27156e7ef205d83f8ac6d')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes/"
}
