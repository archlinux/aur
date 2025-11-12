# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="A modern, retro-styled terminal multiplexer inspired by Norton Disk Doctor (MS-DOS) (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('ae7c498b3b013fe5a98e21c704ad68304e43c7b14776138edc06a744b2d31bba')
sha256sums_aarch64=('1d8ae9ed38891d6b0f405228c3264835efefe2a664431ea5521fabe05fe87597')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
