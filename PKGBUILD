# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.260"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.260.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.260/flyctl_0.0.260_Linux_x86_64.tar.gz")
sha256sums=('8a2fb2aa62f5112c1fbc6a18ff9ba42c3688a1a3069121e10196d19a01dcf906')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

