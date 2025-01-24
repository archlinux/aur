# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.5.1
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7e100bfb416235c832451339da502393b638fc60cd517e5fd5653413e3b66b01')

options=('!strip' '!debug')

package() {
    install -Dm755 "csync" "$pkgdir/usr/bin/csync"
}
