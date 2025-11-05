# Maintainer: DanLin (DanLinX2004X on GitHub)
# Github repo: https://github.com/DanLinX2004X/system-monitor 
pkgname=system-monitor
pkgver=1.1.0
pkgrel=1
pkgdesc="A powerful Bash script for real-time system monitoring (CPU, memory, disk, network, processes)"
arch=('any')
url="https://github.com/DanLinX2004X/system-monitor"
license=('GPL3')
depends=('bash' 'coreutils' 'procps-ng' 'util-linux' 'grep' 'gawk')
optdepends=('bc: for precise calculations')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DanLinX2004X/system-monitor/archive/v$pkgver.tar.gz")
sha256sums=('9587d15a6f0e6fc75f888f8fc91c54e823415fbb10de863f77174423cf220d46')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 system-monitor.sh "$pkgdir/usr/bin/system-monitor"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.ru.md "$pkgdir/usr/share/doc/$pkgname/README.ru.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
