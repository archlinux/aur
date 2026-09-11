pkgname=pomoru-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
license=('MIT')
depends=('gcc-libs')

provides=('pomoru')
conflicts=('pomoru')

source=("pomoru-$pkgver-linux-x86_64.tar.gz::https://github.com/RanXom/pomoru/releases/download/v$pkgver/pomoru-$pkgver-linux-x86_64.tar.gz")
sha256sums=('fbefee8f833ebd64c4b8fbf088e7959960d63617ae547f6a60d6bb7bd5790c6b')

package() {
  cd "$srcdir"
  install -Dm755 pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
