# Maintainer: Tom McKeesick <tmck01@gmail.com>
pkgname=pokesay-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="Print pokemon in the CLI! An adaptation of the classic 'cowsay'"
url="https://github.com/tmck-code/pokesay"
license=("BSD-3-Clause")
arch=("x86_64")
provides=("pokesay")
conflicts=("pokesay")
source=("https://github.com/tmck-code/pokesay/releases/download/v$pkgver/pokesay-$pkgver-linux-amd64.tar.gz")
sha256sums=("349288651c14914985aff3b81dd7c16193a03c1170eea78872ee62c259b4f8f2")

package() {
    install -Dm755 "pokesay-$pkgver-linux-amd64" "$pkgdir/usr/bin/pokesay"
    install -Dm644 "pokesay.1" "$pkgdir/usr/share/man/man1/pokesay.1"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pokesay/LICENSE"
}
