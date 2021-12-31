# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.274"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.274.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.274/flyctl_0.0.274_Linux_x86_64.tar.gz")
sha256sums=('da794f8c0baa5236379187ca8942ad0bf5a326557b177b3229e6af21cd0369e9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

