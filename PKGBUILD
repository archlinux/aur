# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.282"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.282.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.282/flyctl_0.0.282_Linux_x86_64.tar.gz")
sha256sums=('103b4d59f2b2c7c21011d7bfb3ab85c83d2f64f0b2a385cb70743c344fcce439')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

