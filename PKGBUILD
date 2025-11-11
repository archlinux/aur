# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern, retro-styled terminal multiplexer inspired by Norton Disk Doctor (MS-DOS) (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('f8a3e84a6b11366eda42c0f48222d805c32ea13358d27fbeafe186a805fe1aa6')  # Update with actual checksum
sha256sums_aarch64=('eb62e29f2710b336d994efb240a1ef15af31a74672d2e84d52382f6f5b75dd5e')  # Update with actual checksum

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
