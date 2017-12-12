# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='2.99.4'
_pkgdir="3.0.0-b4"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gtk-theme')
provides=('pop-gtk-theme')
source=("https://github.com/pop-os/gtk-theme/releases/download/${_pkgdir}/pop-gtk-theme_${pkgver}_all.deb")
sha256sums=('5b0f04466a255191500b333c2d9a7129c58ca19ce1420a815df27a5d7a07d3f5')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
