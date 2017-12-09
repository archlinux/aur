# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='2.99.2'
_pkgdir="3.0.0-b2"
pkgrel=2
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gnome-shell-theme')
provides=('pop-gnome-shell-theme')
source=("https://github.com/pop-os/gtk-theme/releases/download/${_pkgdir}/pop-gnome-shell-theme_${pkgver}_all.deb")
sha256sums=('33b2adb278489f831a9957f76b08e860075c88f4c3f718aac787036a2e837fda')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
