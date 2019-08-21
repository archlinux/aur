# Maintainer: Luca D'Amico <damico.luca91@live.it>

pkgname=puzzle-bobble-grub2-theme
pkgver=r5.05e4009
pkgrel=1
pkgdesc="Puzzle Bobble Grub2 Theme"
arch=('any')
license=('GPLv3')
depends=()
optdepends=()
install="${pkgname}.install"
url="https://github.com/Luca1991/Puzzle-Bobble-Grub2-Theme"
source=('git+https://github.com/Luca1991/Puzzle-Bobble-Grub2-Theme')
makedepends=('git') 
md5sums=('SKIP')

pkgver() { 
  cd "Puzzle-Bobble-Grub2-Theme" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
} 

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/"
  cp -r "${srcdir}/Puzzle-Bobble-Grub2-Theme/puzzle-bobble" "${pkgdir}/boot/grub/themes/puzzle-bobble"
}
