# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=grub2-theme-cybersynchro
_pkgname=CyberSynchro
pkgver=1.0.0
pkgrel=1
pkgdesc="Grub theme - CyberSynchro 1.0.0"
url="https://github.com/HenriqueLopes42/ThemeGrub.CyberSynchro"
arch=('any')
license=('GPL' 'CCPL:by-sa')
depends=('grub')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahmedmoselhi/ThemeGrub.CyberSynchro/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dbd128a50b7bf6939b56048b18c9a3ca01916ea4b3cf97b15d7b70776ceb4810')

package() {
  cd ThemeGrub.$_pkgname-$pkgver
  install -d "$pkgdir"/boot/grub/themes/CyberSynchro
  cp -a Theme/* "$pkgdir"/boot/grub/themes/CyberSynchro/
  msg ''
  msg '========================================'
  msg 'Installation:'
  msg 'Set GRUB_THEME=\"/boot/grub/themes/CyberSynchro/theme.txt\" in your /etc/default/grub'
  msg 'Preffered resolution: GRUB_GFXMODE=1024x768'
  msg 'After editing, run # grub-mkconfig -o /boot/grub/grub.cfg'
  msg '========================================'
  msg ''
}
