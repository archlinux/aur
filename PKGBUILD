# Maintainer: franlol
pkgname=iptop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="htop for your network — a beautiful real-time IP traffic monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/iptop"
license=('MIT')
provides=('iptop')
conflicts=('iptop')
options=(!strip)
source_x86_64=("iptop-$pkgver-x86_64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.0/iptop-v0.1.0-linux-x64.tar.gz")
source_aarch64=("iptop-$pkgver-aarch64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.0/iptop-v0.1.0-linux-arm64.tar.gz")
sha256sums_x86_64=('d3b6cb94c541831bebdd98c49333752c3c8fa0291099792fcce11b319d196ecf')
sha256sums_aarch64=('f37e2c8d505a130b449a08ec3166167a8386439aa6a967f89a797a3fa9a4ea1d')

package() {
  install -Dm755 "$srcdir/iptop" "$pkgdir/usr/bin/iptop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
