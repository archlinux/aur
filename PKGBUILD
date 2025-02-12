# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.6.1
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('363c476df07b7e24dae322f475ea4b155ed5185a6b98c6ee2201c6d26390da6b')

options=('!strip' '!debug')

depends=('webkit2gtk-4.1')

package() {
    install -Dm755 "csync-server" "$pkgdir/usr/bin/csync-server"
    install -Dm755 "csyncd" "$pkgdir/usr/bin/csyncd"
    install -Dm755 "csynctl" "$pkgdir/usr/bin/csynctl"
}
