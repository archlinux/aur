# Maintainer: Luca D'Amico <damico.luca91@live.it>

pkgname=puzzle-bobble-grub2-theme
dirname="Puzzle-Bobble-Grub2-Theme"
pkgver=1.0
pkgrel=3
pkgdesc="Puzzle Bobble Grub2 Theme"
arch=('any')
license=('GPLv3')
depends=('grub')
install="${pkgname}.install"
url="https://github.com/Luca1991/Puzzle-Bobble-Grub2-Theme"
source=("https://github.com/Luca1991/Puzzle-Bobble-Grub2-Theme/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('42faf403a3bced45fcf5644003b1eefba322bab8e5e03b0b0d520a2d79217ddd')

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/"
  cp -r "${srcdir}/$dirname-$pkgver/puzzle-bobble" "${pkgdir}/boot/grub/themes/puzzle-bobble"
}
