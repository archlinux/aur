# Maintainer: Norbert <sandwich@archworks.co>

pkgname=ft-bin
pkgver=2.2.4
pkgrel=2
pkgdesc="Tunnel TCP connections through a file"
arch=('x86_64' 'aarch64')
url="https://github.com/fiddyschmitt/File-Tunnel"
license=('MIT')
source_x86_64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-x64")
source_aarch64=("ft::https://github.com/fiddyschmitt/File-Tunnel/releases/download/v${pkgver}/ft-linux-arm64")
sha256sums_x86_64=('0387c640a2cc667f56747afe027b7e166f1b5714bd5bd0f5609e009755bd4f09')
sha256sums_aarch64=('0387c640a2cc667f56747afe027b7e166f1b5714bd5bd0f5609e009755bd4f09')

package() {
  install -Dm755 "$srcdir/ft" "$pkgdir/usr/bin/ft"
}
