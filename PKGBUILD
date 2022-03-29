# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.310"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.310.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.310/flyctl_0.0.310_Linux_x86_64.tar.gz")
sha256sums=('23c7027b91330fc328813cf9075faf808393035d3fa6fd24c989a124c53055e9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

