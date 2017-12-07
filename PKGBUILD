# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='adapta-gtk-theme-bin'
pkgver='3.92.2.33'
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/tista500/Adapta'
license=('CCPL' 'GPL2')
conflicts=('adapta-gtk-theme' 'adapta-gtk-theme-git')
provides=('adapta-gtk-theme')
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${pkgver}-0ubuntu1~bionic1_all.deb")
sha256sums=('adec157844ab22eef82ae0c41b4ef8a9f6e1afaf496a242a5d6bfb3613cb35a4')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
