# Maintainer: Sfincs <fra.tw138@gmail.com>

pkgname=grub2-themes-dharma
pkgver=1.6
pkgrel=1
pkgdesc="Chakra Dharma Grub2-theme."
url="http://chakra-project.org"
arch=('any')
license=('CC-BY-ND')
depends=('grub')
source=("http://chakra.sourceforge.net/sources/chakra-artwork/dharma/grub2-themes/1.6/Dharma.tar.xz")
md5sums=('d708232349e14966304c3ee4c86e6687')

package() {
  cd "${srcdir}"
  mkdir -p "$pkgdir/boot/grub/themes"
  cp -r Dharma "$pkgdir/boot/grub/themes"
}
