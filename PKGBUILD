# Maintainer: franlol
pkgname=iptop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="htop for your network — a beautiful real-time IP traffic monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/iptop"
license=('MIT')
provides=('iptop')
conflicts=('iptop')
options=(!strip)
source_x86_64=("iptop-$pkgver-x86_64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.2/iptop-v0.1.2-linux-x64.tar.gz")
source_aarch64=("iptop-$pkgver-aarch64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.2/iptop-v0.1.2-linux-arm64.tar.gz")
sha256sums_x86_64=('51ede27a2f8b854f68787e099c17f1e73d386fed6d919acbf80b2c50660080d0')
sha256sums_aarch64=('f754c5da9531370e357dc61ee8bd15e771a276184e74fb71c151eca7f6be428a')

package() {
  install -Dm755 "$srcdir/iptop" "$pkgdir/usr/bin/iptop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
