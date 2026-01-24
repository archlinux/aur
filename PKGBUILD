pkgname=yufi-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight GTK4 Wi-Fi manager (binary release)"
arch=("x86_64")
url="https://github.com/AtefR/YuFi"
license=("MIT")
provides=("yufi")
conflicts=("yufi")
depends=("gtk4" "networkmanager")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/YuFi/releases/download/v$pkgver/yufi-$pkgver-x86_64.tar.gz")
sha256sums=('30a3288403c8c7e8ebf1b02ae16f1ff667e1c97f03fbecc7fa3d521ea24813ce')

package() {
  cd "$srcdir"
  cp -a usr "$pkgdir/"
  install -Dm644 "$pkgdir/usr/share/licenses/yufi/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
