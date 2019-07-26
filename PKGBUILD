# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-vimix
pkgver=1.2
pkgrel=1
pkgdesc='vimix grub2 theme'
arch=(any)
url='https://github.com/vinceliuice/grub2-themes'
license=('GPL')
depends=('grub')
optdepends=('grub-customizer')
install=${pkgname}.install

source=('https://github.com/vinceliuice/grub2-themes/archive/1.2.tar.gz')

md5sums=('SKIP')

package() {
  install -dm755 $pkgdir/boot/grub/themes/
  cp -r $srcdir/grub2-themes-$pkgver/grub-theme-vimix/Vimix $pkgdir/boot/grub/themes/
}
