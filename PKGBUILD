# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.180"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.180.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.180/flyctl_0.0.180_Linux_x86_64.tar.gz")
sha256sums=('31e5482f2c9e603b2e569a091c848d3dc5f3456e4d273c91644287498ae2a2bf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}