# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.417"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.417.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.417/flyctl_0.0.417_Linux_x86_64.tar.gz")
sha256sums=('06b924da083a9de51bfb4c994d24699ae11a9f9de145f1de35ae43c25b9a9195')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
