# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='2.99.2'
_pkgdir="3.0.0-b2"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gtk-theme')
provides=('pop-gtk-theme')
source=("https://github.com/pop-os/gtk-theme/releases/download/${_pkgdir}/pop-gtk-theme_${pkgver}_all.deb")
sha256sums=('56beb922d115650f06f805facd181b40c202febe8b396c5c79b520f2b7deafce')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
