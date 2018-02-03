# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='adapta-gtk-theme-bin'
pkgver='3.93.0.106'
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/tista500/Adapta'
license=('CCPL' 'GPL2')
conflicts=('adapta-gtk-theme' 'adapta-gtk-theme-git')
provides=('adapta-gtk-theme')
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${pkgver}-0ubuntu1~bionic1_all.deb")
sha256sums=('4658549d4f590ab3de8d01ea1075a5bd86e8cd6eee5c59cf86dbe66c7a881128')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
