# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.415"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.415.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.415/flyctl_0.0.415_Linux_x86_64.tar.gz")
sha256sums=('c4ee565cb8a7b4c2b3db47f0d95ab75f73936f45fad1199e0ebf4eaa73a92d01')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
