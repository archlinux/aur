# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source_x86_64=("sldr-bin-0.10.0-x86_64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e83bdb8fa35039d0adf6274cfb9dfd89da72b5c34f1e45e09e9c31bc74ca1e3d')
source_aarch64=("sldr-bin-0.10.0-aarch64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a6ef5bd375bb15946f40bc752298422a756274124d4653775e3c3e5669723308')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 */bin/sldr-server "$pkgdir/usr/bin/sldr-server"
}
