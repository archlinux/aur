# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.305"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.305.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.305/flyctl_0.0.305_Linux_x86_64.tar.gz")
sha256sums=('6d91882be67f2a5557bb0a78b67d88297f68ada3fb2beb98b3bc3e6ec624616f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

