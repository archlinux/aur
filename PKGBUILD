# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A modern, retro-styled terminal multiplexer inspired by Norton Disk Doctor (MS-DOS) (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('e0f3f6cbe9d05ca0e929782264070788c98a5a852c80448b2547a22ddb36c6d9')
sha256sums_aarch64=('2b2941b3f4b10f237aac4a73aa0e5c597f954a33c0218af3a552442b739c372e')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
