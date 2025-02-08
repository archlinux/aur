# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.6.0
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('260ceb13077c16aea566a03018ea407f7aa18d0c0fb6b461977581bc9a7ecac9')

options=('!strip' '!debug')

package() {
    install -Dm755 "csync-server" "$pkgdir/usr/bin/csync-server"
    install -Dm755 "csyncd" "$pkgdir/usr/bin/csyncd"
    install -Dm755 "csynctl" "$pkgdir/usr/bin/csynctl"
}
