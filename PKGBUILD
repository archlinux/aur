# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.261"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.261.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.261/flyctl_0.0.261_Linux_x86_64.tar.gz")
sha256sums=('cf5e939fde3ae61d6556cd078d129b0c4c3d23e78ca0dcfda8ae2d286f029304')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

