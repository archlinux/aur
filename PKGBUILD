# Maintainer: franlol
pkgname=iptop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="htop for your network — a beautiful real-time IP traffic monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/iptop"
license=('MIT')
provides=('iptop')
conflicts=('iptop')
options=(!strip)
source_x86_64=("iptop-$pkgver-x86_64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.1/iptop-v0.1.1-linux-x64.tar.gz")
source_aarch64=("iptop-$pkgver-aarch64.tar.gz::https://github.com/franlol/iptop/releases/download/v0.1.1/iptop-v0.1.1-linux-arm64.tar.gz")
sha256sums_x86_64=('35af78a63f027b8877dea251811bc29f5a1e9bb9a16afed6931f844be13b3705')
sha256sums_aarch64=('663591231a6428e6ceddbb7519cf38c1b5860ec782431361f7502cfee8c96e04')

package() {
  install -Dm755 "$srcdir/iptop" "$pkgdir/usr/bin/iptop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
