# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Put icons always in folder with version and release
pkgname=super-ultra-flat-numix-remix-icons-git
pkgver=4.2
pkgrel=3
pkgdesc="super-ultra-flat-numix-remix-git is an icon theme build upon 4 different icon sets - check github for more info"
arch=('any')
url="https://github.com/erikdubois/Super-Ultra-Flat-Numix-Remix"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('super-ultra-flat-numix-remix-icons-git')
options=(!strip !emptydirs)
install='super-ultra-flat-numix-remix-icons-git.install'
source=('Super-Ultra-Flat-Numix-Remix::git+https://github.com/erikdubois/Super-Ultra-Flat-Numix-Remix.git')
sha256sums=('SKIP')

package() {
  cd Super-Ultra-Flat-Numix-Remix

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Super-Ultra-Flat-Numix-Remix-Arch-Blue "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Super-Ultra-Flat-Numix-Remix-Majestic "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Super-Ultra-Flat-Numix-Remix-Orange "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Super-Ultra-Flat-Numix-Remix "${pkgdir}"/usr/share/icons/
}
