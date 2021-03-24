# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.193"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.193.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.193/flyctl_0.0.193_Linux_x86_64.tar.gz")
sha256sums=('d2481a3de7ffb42f876e2dec194149154207b843a5f3f6761f9cd82cde58464b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}