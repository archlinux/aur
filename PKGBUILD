# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.386"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.386.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.386/flyctl_0.0.386_Linux_x86_64.tar.gz")
sha256sums=('d2c13ace9e7aec6c0652203fb42212434bfe3ad884b7dc3c83aa491cb642e4da')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
