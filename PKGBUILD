pkgname=yufi-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Lightweight GTK4 Wi-Fi manager (binary release)"
arch=("x86_64")
url="https://github.com/AtefR/YuFi"
license=("MIT")
provides=("yufi")
conflicts=("yufi")
depends=("gtk4" "networkmanager")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/YuFi/releases/download/v$pkgver/yufi-$pkgver-x86_64.tar.gz")
sha256sums=('2ee57bfe85a49ee4040eb54d7b82b1529a4c9ef1045fbaebe777a62f41e8953f')

package() {
  cd "$srcdir"
  cp -a usr "$pkgdir/"
  install -Dm644 "$pkgdir/usr/share/licenses/yufi/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
