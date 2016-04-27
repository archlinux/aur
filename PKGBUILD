pkgname=arch-silence-grub-theme
pkgver=r1.3c851d8
pkgrel=1
pkgdesc="Arch Silence - GRUB2 theme"
arch=('any')
license=('GPL')
depends=()
optdepends=()
install="${pkgname}.install"
url="https://github.com/fghibellini/arch-silence"
source=('git+https://github.com/fghibellini/arch-silence')
makedepends=('git') 
md5sums=('SKIP')

pkgver() { 
  cd "arch-silence" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
} 

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/arch-silence"
  cp -TR "${srcdir}/arch-silence/theme" "${pkgdir}/boot/grub/themes/arch-silence"
}
