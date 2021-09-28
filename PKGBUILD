# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.243"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.243.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.243/flyctl_0.0.243_Linux_x86_64.tar.gz")
sha256sums=('3e44e9b32c93f944b8f4bbf37d9a3b5d9c2c411c8f2d3a7f1f06aa27ffefca98')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}