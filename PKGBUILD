# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.447"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.447.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.447/flyctl_0.0.447_Linux_x86_64.tar.gz")
sha256sums=('95d42c92266b3c28516abaf6d3b1cc9431c850ac47c2e979a7d1a9222572052f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
