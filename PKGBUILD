# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=grub2-theme-dharma-mod
pkgver=1.0
pkgrel=1
pkgdesc="Slightly adapted GRUB2 gfxmenu theme from Chakra's Dharma theme. Fits well to Caledonia art suite (same author)."
url="http://malcer.deviantart.com"
arch=('any')
license=('CC-BY-SA')
depends=('grub-common')
install=${pkgname}.install
source=("Dharma-GRUB2-mod.tar.xz")
md5sums=('eb171937df718de9b04c2da1823d4c8e')

package() {
  cd "${srcdir}"
  mkdir -p "$pkgdir/boot/grub/themes"
  cp -r Dharma "$pkgdir/boot/grub/themes"
}
