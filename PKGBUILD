# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — prebuilt binary"
arch=('x86_64')
url="https://github.com/Coobyk/tdrive-rs"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-linux-x86_64-$pkgver.tar.gz::https://github.com/Coobyk/tdrive-rs/releases/download/v$pkgver/tdrive-rs-linux-x86_64.tar.gz")
sha256sums=('f55af86af36a5ef668071787f5154d30ba98bfcc2d8ea2de383fc49582f078ce')

package() {
    install -Dm755 "tdrive-rs" "$pkgdir/usr/bin/tdrive"
}
