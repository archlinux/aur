# Maintainer: Techyiola <your-email@example.com>
pkgname=arch-health
pkgver=1.0.0
pkgrel=1
pkgdesc="Modular system health checker for Arch Linux — battery, temps, memory, disk and more"
arch=('any')
url="https://github.com/Techyiola/arch-health"
license=('Apache-2.0')
depends=('lm_sensors' 'smartmontools' 'upower' 'pacman-contrib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Techyiola/arch-health/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 syshealth "$pkgdir/usr/local/bin/syshealth"
  install -Dm755 install.sh "$pkgdir/usr/local/share/$pkgname/install.sh"
  install -Dm644 README.md "$pkgdir/usr/local/share/doc/$pkgname/README.md"
}
