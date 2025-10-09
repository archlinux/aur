# made by runtime-erop
pkgname=arch32api
pkgver=1.0.0
pkgrel=1
pkgdesc="Win32API compatibility layer for Arch Linux using ydotool and xdotool"
arch=('any')
url="https://github.com/runtime-erop/arch32api"
license=('MIT')
depends=('python' 'xdotool' 'ydotool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/runtime-erop/arch32api/archive/$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual hash

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 arch32api.py "$pkgdir/usr/lib/python3.11/site-packages/arch32api.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}