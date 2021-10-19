# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.248"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.248.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.248/flyctl_0.0.248_Linux_x86_64.tar.gz")
sha256sums=('4b8da5217c0b51cb3fe06cb787e657a927102319d302b826236df3a5522ab76f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}