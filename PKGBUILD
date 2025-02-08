# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.5.2
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('cb7cdcb144bc074ad80505eabbadd73d6eedcb8919cfcb309559f06b06811e63')

options=('!strip' '!debug')

package() {
    install -Dm755 "csync-server" "$pkgdir/usr/bin/csync-server"
    install -Dm755 "csyncd" "$pkgdir/usr/bin/csyncd"
    install -Dm755 "csynctl" "$pkgdir/usr/bin/csynctl"
}
