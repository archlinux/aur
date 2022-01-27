# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.290"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.290.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.290/flyctl_0.0.290_Linux_x86_64.tar.gz")
sha256sums=('5d0e5e1d11014ac1cfedf77bf0dbb8a0328aa6022d6f7b0d5e2823237379dce1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

