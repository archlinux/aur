# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>
pkgname=rust-motd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Beautiful, useful MOTD generation with zero runtime dependencies"
url="https://github.com/rust-motd/rust-motd"
license=("MIT")
arch=("x86_64")
provides=("rust-motd")
source=("https://github.com/rust-motd/rust-motd/releases/download/v$pkgver/rust-motd-$pkgver-x86_64.tar.gz")
sha256sums=("a8908b98d214e75dcb93f13dec2c06a0f5f29a5b8bfd85c7797d884dfe758f9c")

package() {
    install -Dm755 rust-motd -t "$pkgdir/usr/bin/"
}
