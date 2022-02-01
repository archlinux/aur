# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.293"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.293.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.293/flyctl_0.0.293_Linux_x86_64.tar.gz")
sha256sums=('6a74484578eaa77bf1d48976a5ce22498f7bb9598acc3b17571710ae6d9809c3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

