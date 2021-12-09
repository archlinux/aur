# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.263"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.263.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.263/flyctl_0.0.263_Linux_x86_64.tar.gz")
sha256sums=('d3b1b486a77765b6ac997bc279a9355a7a9babe54cc99a8e4f67ec040d499b75')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

