# Maintainer: Zhang.j.k <zhangjk67@gmail.com>

pkgname=cyberpunk-grub-theme-git
_theme=Cyberpunk
pkgver=1.0
pkgrel=2
pkgdesc="A GRUB Bootloader Theme Inspired by Cyberpunk 2077 Video Game."
url='https://github.com/anoopmsivadas/Cyberpunk-GRUB-Theme'
arch=('any')
license=('custom:cc0')
depends=('grub')
makedepends=('git')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/anoopmsivadas/Cyberpunk-GRUB-Theme")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  install -dm 755 $pkgdir/usr/share/grub/themes/Cyberpunk
  cp -rf --no-preserve=ownership cyberpunk-grub-theme-git/Cyberpunk $pkgdir/usr/share/grub/themes/
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}