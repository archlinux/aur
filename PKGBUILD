# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grub-holdshift
pkgver=1.2
pkgrel=2
pkgdesc="Script to hide GRUB unless shift is held down."
arch=("any")
license=('GPL')
depends=("grub")
install=$pkgname.install
source=(https://github.com/hobarrera/${pkgname}/archive/v${pkgver}.zip)
md5sums=('ee5422713548aa927322ba18f97b8798')
url="https://github.com/hobarrera/grub-holdshift"

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 31_hold_shift "$pkgdir/etc/grub.d/31_hold_shift"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
