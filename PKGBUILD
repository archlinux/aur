# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.3.0
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('02760e18dd647598d7b017f89dac744ea983fb593093671396d3215f50890fea')

package() {
    install -Dm755 "csync" "$pkgdir/usr/bin/csync"
}
