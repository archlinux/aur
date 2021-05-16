# Maintainer: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme
_pkgname=Sweet
pkgver=2.0
pkgrel=1
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
provides=('sweet-theme')
conflicts=('sweet-theme')
replaces=('sweet-theme')
source=("$url/releases/download/${pkgver}/${_pkgname}.tar.xz")
md5sums=('5a457d3e1c7210a875cf98cf5aa1f050')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes/"
}
