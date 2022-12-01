# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.436"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.436.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.436/flyctl_0.0.436_Linux_x86_64.tar.gz")
sha256sums=('c287ad67d5796c0feb2b209f250610a3b57cb329bd08ab0ad356e354e83b3993')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
