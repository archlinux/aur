# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.187"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.187.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.187/flyctl_0.0.187_Linux_x86_64.tar.gz")
sha256sums=('bb4d26452d6f52de1cce8bfea48e3a03f1ef6d90ca3d9537238ba0a5a368a96f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}