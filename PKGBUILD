pkgname=pomoru-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
license=('MIT')
depends=('gcc-libs')

provides=('pomoru')
conflicts=('pomoru')

source=("pomoru-$pkgver-x86_64.tar.gz::https://github.com/RanXom/pomoru/releases/download/v$pkgver/pomoru-$pkgver-x86_64.tar.gz")
sha256sums=('a0636b2eaed3c16f528924196d8cf0c53a0ab72457f9d20685284587f338a8e9')

package() {
  cd "pomoru-$pkgver-x86_64"
  install -Dm755 pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
