# Maintainer: DanLin <daniill02604@gmail.com>
# Github repo: https://github.com/DanLinX2004X/system-monitor 
pkgname=system-monitor
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful Bash script for real-time system monitoring (CPU, memory, disk, network, processes)"
arch=('any')
url="https://github.com/DanLinX2004X/system-monitor"
license=('GPL3')
depends=('bash' 'coreutils' 'procps-ng' 'util-linux' 'grep' 'gawk')
optdepends=('bc: for precise calculations')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DanLinX2004X/system-monitor/archive/v$pkgver.tar.gz")
sha256sums=('7eb18b7a4ee21e71ccc180011f50ba77e1442011e8ac0a72a94c7e0105e6653f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 system-monitor.sh "$pkgdir/usr/bin/system-monitor"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.ru.md "$pkgdir/usr/share/doc/$pkgname/README.ru.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
