pkgname=yufi-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight GTK4 Wi-Fi manager (binary release)"
arch=("x86_64")
url="https://github.com/AtefR/YuFi"
license=("MIT")
provides=("yufi")
conflicts=("yufi")
depends=("gtk4" "networkmanager")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/YuFi/releases/download/v$pkgver/yufi-$pkgver-x86_64.tar.gz")
sha256sums=('43928c12b0c53249b22c8bb005594dbc4c8d2e84f7ee06f251a547312490b714')

package() {
  cd "$srcdir"
  cp -a usr "$pkgdir/"
  install -Dm644 "$pkgdir/usr/share/licenses/yufi/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
