# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.380"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.380.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.380/flyctl_0.0.380_Linux_x86_64.tar.gz")
sha256sums=('1595d9a2ec587140daaad9d9b6f0d5d023b529c08e8393195fa3f6db42bb0292')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
