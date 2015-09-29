pkgname=arch-silence-grub-theme
pkgver=1.0
pkgrel=1
pkgdesc="Arch Silence - GRUB2 theme"
arch=('any')
license=('GPL')
depends=()
optdepends=()
url="https://github.com/fghibellini/arch-silence"
source=(git://github.com/fghibellini/arch-silence.git)
md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/arch-silence"
  cp -TR "${srcdir}/arch-silence/theme" "${pkgdir}/boot/grub/themes/arch-silence"
  msg 'You still need to go to the file "/etc/default/grub"'
  msg 'and update the variable GRUB_THEME="/boot/grub/themes/arch-silence/theme.txt"'
}
