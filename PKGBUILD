# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='adapta-gtk-theme-bin'
pkgver='3.92.1.73'
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/tista500/Adapta'
license=('CCPL' 'GPL2')
conflicts=('adapta-gtk-theme' 'adapta-gtk-theme-git')
provides=('adapta-gtk-theme')
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${pkgver}-0ubuntu1~artful1_all.deb")
sha256sums=('ecf1c1a8c9fbe08f7c2c84afa4fae7cce6c89ff3a33ba5003701e44cdbd43091')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
