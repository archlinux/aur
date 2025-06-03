# Maintainer: Hazel Summer Thomas <mail@kannadev.com>
pkgname=tscli
pkgver=0.0.7
pkgrel=1
pkgdesc="tscli is a fast, single-binary CLI for the Tailscale HTTP API."
arch=('x86_64' 'aarch64')
url="https://github.com/jaxxstorm/tscli"
license=('MIT')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/jaxxstorm/tscli/releases/download/v${pkgver}/tscli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/jaxxstorm/tscli/releases/download/v${pkgver}/tscli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8e215b51f03d5d429c22ddcb6becd01a2f865e2fbb7086a957a271d2557f8e42')
sha256sums_aarch64=('1ea94934a899ecff1e856b6ddbc582beb52b20afaa88c30b060a7fa21facd8c7')

package() {
  install -Dm755 "$srcdir/tscli" "$pkgdir/usr/bin/tscli"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
