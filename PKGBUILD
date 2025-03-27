# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=filewarden-release
pkgver=0.1.0
pkgrel=1
pkgdesc="Password-based symmetric encryption of files"
arch=('x86_64')
url="https://github.com/fioncat/filewarden"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/filewarden/releases/download/v${pkgver}/fwd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('23cedf36753dc94a321f337743bc8aacf890a83e4aed7c4aeaab4dc0cc7c10ed')

options=('!strip' '!debug')

package() {
    install -Dm755 "fwd" "$pkgdir/usr/bin/fwd"
}
