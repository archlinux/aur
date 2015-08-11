# Maintainer: se7enday(87635645#qq.com)

pkgname=grub2-theme-vimix
pkgver=1.0
pkgrel=5
pkgdesc="A blur theme for grub"
url="https://github.com/Se7endAY/grub2-theme-vimix"
arch=('any')
license=('GPLv3')
depends=('grub')
install=${pkgname}.install
source=("https://github.com/Se7endAY/${pkgname}/archive/master.zip")
md5sums=('SKIP')

package() {
  cd "$srcdir/grub2-theme-vimix-master"
  mkdir -p "$pkgdir/boot/grub/themes"
  cp -fr Vimix "$pkgdir/boot/grub/themes"
}

