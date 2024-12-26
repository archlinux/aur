# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.4.0
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('0fba4df337e347853a9053de94d96a572650a8ed9a9350e7f7d77c03a83dd81a')

options=('!strip' '!debug')

package() {
    install -Dm755 "csync" "$pkgdir/usr/bin/csync"
}
