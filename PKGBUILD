# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.385"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.385.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.385/flyctl_0.0.385_Linux_x86_64.tar.gz")
sha256sums=('17bc6d0da123f31c26918c234a454a33d3dec617ee50bf24ae3c31d82fb30858')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
