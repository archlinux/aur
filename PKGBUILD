# Maintainer: murugnn <murugnn9@gmail.com>
pkgname=comm-line
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based peer-to-peer chat application written in Python"
arch=('any')
url="https://github.com/murugnn/comm-line.git"
license=('MIT')
depends=('python' 'python-colorama' 'python-pyfiglet')
source=("comm-line.py")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/comm-line.py" "$pkgdir/usr/bin/comm-line"
}
