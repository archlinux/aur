# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.140"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-$pkgver.tgz::https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('0dc836749030ae5c1469e4bb0a005f7ada0e080cc6cdcb63fae2c9f0c8efc35d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}
