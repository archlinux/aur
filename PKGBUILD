# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=grub2-theme-arch-leap
pkgver=1
pkgrel=4
pkgdesc="Arch Linux branded theme adapted from openSUSE Leap 42.1"
url="https://github.com/i3wm/grub2-theme-arch-leap"
arch=('any')
license=('GPL' 'CCPL:by-sa')
depends=('grub')
source=("$pkgname-$pkgver.tar.gz::https://github.com/i3wm/grub2-theme-arch-leap/archive/$pkgver.tar.gz")
sha256sums=('ab67c35a5da28a109dbab493909ee7e1f9ad851274a42b0ff1aea03a73712100')

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/boot/grub/themes/arch-leap
  install -m644 TRADEMARKS theme/* "$pkgdir"/boot/grub/themes/arch-leap/
  msg ''
  msg '========================================'
  msg 'Installation:'
  msg 'Set GRUB_THEME=\"/boot/grub/themes/arch-leap/theme.txt\" in your /etc/default/grub'
  msg 'Preffered resolution: GRUB_GFXMODE=1024x768'
  msg 'After editing, run # grub-mkconfig -o /boot/grub/grub.cfg'
  msg '========================================'
  msg ''
}
