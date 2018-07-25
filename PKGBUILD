# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='adapta-gtk-theme-bin'
pkgver='3.94.0.42'
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/tista500/Adapta'
license=('CCPL' 'GPL2')
conflicts=('adapta-gtk-theme' 'adapta-gtk-theme-git')
provides=('adapta-gtk-theme')
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${pkgver}-0ubuntu1~cosmic1_all.deb")
sha256sums=('3741f5acc298bae1de73d6f04dae8797acaf1eddec4c1aa60b1a3e168517b42a')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
