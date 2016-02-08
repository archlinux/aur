# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=yltra-flat-icon-git
pkgver=2.4
pkgrel=0
pkgdesc="Yltra Flat is an icon theme build upon Ultra Flat icons"
arch=('any')
url="https://github.com/erikdubois/yltra-flat-icon-theme"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
#groups=()
#depends=()
makedepends=('git')
provides=('yltra-flat-icon-git')
#conflicts=()
#replaces=()
#backup=()
options=('!strip')
install='yltra-flat-icon-git.install'
#changelog=
#source=($pkgname-$pkgver.tar.gz)
source=('yltra-flat-icon-git::git+https://github.com/erikdubois/yltra-flat-icon-theme.git')
#noextract=()
sha256sums=('SKIP')
#md5sums=() #autofill using updpkgsums

package() {
  cd yltra-flat-icon-theme

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Yltra\ Flat "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra\ Flat\ Arch\ Blue "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra\ Flat\ Majestic "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra\ Flat\ Mint\ Green "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Yltra\ Flat\ Orange "${pkgdir}"/usr/share/icons/
}

