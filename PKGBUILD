# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=yltra-flat-icons-git
pkgver=2.6
pkgrel=2
pkgdesc="Yltra Flat is an icon theme build upon Ultra Flat icons"
arch=('any')
url="https://github.com/erikdubois/yltra-flat-icon-theme"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('yltra-flat-icon-git')
options=(!strip !emptydirs)
install='yltra-flat-icon-git.install'
source=('yltra-flat-icon-theme::git+https://github.com/erikdubois/yltra-flat-icon-theme.git')
sha256sums=('SKIP')

package() {
  cd yltra-flat-icon-theme

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Yltra-Flat "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra-Flat-Arch-Blue "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra-Flat-Majestic "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra-Flat-Mint-Green "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra-Flat-Orange "${pkgdir}"/usr/share/icons/
}

