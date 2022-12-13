# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.439"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.439.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.439/flyctl_0.0.439_Linux_x86_64.tar.gz")
sha256sums=('4e49d5a38ff961888032878daf258f28c378dc8ef08c043e1c47ea55711a9868')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
