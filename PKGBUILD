pkgname=audium
pkgver=0.9.1
pkgrel=2
pkgdesc="Terminal music app built in Rust"
arch=('x86_64')
url="https://github.com/takashialpha/audium"
license=('Apache-2.0')
depends=('alsa-lib')

source=("https://github.com/takashialpha/audium/releases/download/v${pkgver}/audium-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # Install the binary
  install -Dm755 audium "$pkgdir/usr/bin/audium"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
