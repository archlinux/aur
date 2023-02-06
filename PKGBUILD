# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.453"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.453.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.453/flyctl_0.0.453_Linux_x86_64.tar.gz")
sha256sums=('bed432c28a4d36d41cfe5d32cdecf627c7ecffe911b4f1ee9f8ecb7fea190bf6')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
