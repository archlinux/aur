# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=surfn-icons-git
pkgver=9.1
pkgrel=4
pkgdesc="Surfn is a colourful icon theme."
arch=('any')
url="https://github.com/erikdubois/Surfn"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('surfn-icons-git')
options=(!strip !emptydirs)
source=('Surfn::git+https://github.com/erikdubois/Surfn.git')
sha256sums=('SKIP')

package() {
  cd Surfn

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' 'Surfn' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Arc' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Arch-Blue' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Breeze-Dark' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Evopop' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Luv' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Luv-Red' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Majestic' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Mint-X-Grey' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Numix' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Numix-Misty' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Numix-Polo' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Orange' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Papirus-Blue' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Papirus-Grey' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn-Vertexed' "${pkgdir}"/usr/share/icons/


}
