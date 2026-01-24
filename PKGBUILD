pkgname=yufi-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight GTK4 Wi-Fi manager (binary release)"
arch=("x86_64")
url="https://github.com/AtefR/YuFi"
license=("MIT")
provides=("yufi")
conflicts=("yufi")
depends=("gtk4" "networkmanager")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/YuFi/releases/download/v$pkgver/yufi-$pkgver-x86_64.tar.gz")
sha256sums=('e8f5720c5aacabfa7a3750f60e0ba3aeb8e5755da93c47dd28bda3a36cc0cac5')

package() {
  cd "$srcdir"
  cp -a usr "$pkgdir/"
  install -Dm644 "$pkgdir/usr/share/licenses/yufi/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
