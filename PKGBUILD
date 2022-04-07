# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.316"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.316.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.316/flyctl_0.0.316_Linux_x86_64.tar.gz")
sha256sums=('da09bb4b7e6b6f4b565f2a7cb417f1bdb5170da48908d4c88fa30587403ead27')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

