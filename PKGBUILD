# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.413"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.413.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.413/flyctl_0.0.413_Linux_x86_64.tar.gz")
sha256sums=('941e3c2e0d261c6c71519a43a87656c83b2b2d701831cc136ed6a0bc885d6cf5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
