# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.362"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.362.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.362/flyctl_0.0.362_Linux_x86_64.tar.gz")
sha256sums=('e52b0ad9c9fe69703b1e5824f78b7d60d12e25cdb3f2699d61c2e2cd90a1ad5d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

