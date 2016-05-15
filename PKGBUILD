# Maintainer: Michael Straube <m.s.online gmx.de>
pkgname=grub2-theme-arch-leap
pkgver=1
pkgrel=1
pkgdesc="Arch Linux branded theme adapted from openSUSE Leap 42.1"
url="https://github.com/mis2/grub2-theme-arch-leap"
arch=('any')
license=('GPL')
depends=('grub')
source=("https://github.com/mis2/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('04f0662dc3a550cff61c9cfab50669b05bd2ac09')

package() {
  cd $pkgname-$pkgver/theme
  install -dm755 "$pkgdir/boot/grub/themes/arch-leap"
  install -m644 * "$pkgdir/boot/grub/themes/arch-leap/"
}
