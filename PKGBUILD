# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=("iq=$pkgver")
conflicts=('iq')

source_x86_64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('58eb36dc0a24caa43cbcb78660cc4b7cfa0204a9241cc9ad86bb3f73ac81a793')

source_aarch64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('aa07fef446de261951dda13c745b5fd1b6f5b3ef2da48958a3c7214cd92bf537')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/iq"
}
