pkgname=python-arch32api
pkgver=1.0.0
pkgrel=1
pkgdesc="Win32API compatibility layer for Arch Linux using ydotool and xdotool"
arch=('any')
url="https://aur.archlinux.org/packages/python-arch32api"
license=('MIT')
depends=('python' 'xdotool' 'ydotool')
source=("arch32api.py"
        "LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir"
  install -Dm644 arch32api.py "$pkgdir/usr/lib/python3.11/site-packages/arch32api.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}