# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=("iq=$pkgver")
conflicts=('iq')

source_x86_64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('746372947ba5c9830b864e0a77be8dbfc85fce35d95d6276ed6429404d01bb6a')

source_aarch64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('5afdcd8a147d784c2ea4cd6087ae89ce31b19f5dfba0b82e31264fa83e9b842b')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/iq"
}
