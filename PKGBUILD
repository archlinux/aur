# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='2.2.0'
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
sha256sums=('5e7a7f1f006a561d9fec68a3577e9f73dee39b86b7b92a99951b9eb369dc577c')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
