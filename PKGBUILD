# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.197"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.197.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.197/flyctl_0.0.197_Linux_x86_64.tar.gz")
sha256sums=('f73b0d0e699ac4507a8da449917fb4c6c96de8b621faec909f1b0feae36f3aed')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}