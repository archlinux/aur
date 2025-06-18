# Maintainer: Meet Soni <your@email.com>
pkgname=smyte
pkgver=1.0.0
pkgrel=1
pkgdesc="A ricer-style terminal tool that displays live network usage with ASCII art"
arch=('any')
url="https://github.com/yourusername/smyte"
license=('MIT')
depends=('python' 'python-rich' 'python-psutil')
source=('smyte.py' 'banner.txt')
md5sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/smyte.py" "$pkgdir/usr/bin/smyte"
  install -Dm644 "$srcdir/banner.txt" "$pkgdir/usr/share/smyte/banner.txt"
}
