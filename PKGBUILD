pkgname=pomoru-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
license=('MIT')
depends=('gcc-libs')

provides=('pomoru')
conflicts=('pomoru')

source=("pomoru-$pkgver-x86_64.tar.gz::https://github.com/RanXom/pomoru/releases/download/v$pkgver/pomoru-$pkgver-x86_64.tar.gz")
sha256sums=('edc6d87f0b52a2d7bceeaf6910ee38be04f55c7342a07963bbb06ae25716af18')

package() {
  cd "pomoru-$pkgver-x86_64"
  install -Dm755 pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
