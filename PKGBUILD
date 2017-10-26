# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='2.2.3'
_pkgdir="${pkgver}-0"
_pkgver="${pkgver}.0"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gtk-theme')
provides=('pop-gtk-theme')
source=("https://github.com/system76/pop-gtk-theme/releases/download/${_pkgdir}/pop-gtk-theme_${_pkgver}_all.deb")
sha256sums=('1015f94785700c537e42058779489e4f3a8ef8b1a649398e09bfcf04b8505f93')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
