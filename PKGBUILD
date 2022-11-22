# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.435"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.435.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.435/flyctl_0.0.435_Linux_x86_64.tar.gz")
sha256sums=('84c43ec1c62f7671a75984e5ebb2607bd122dcb7295e18c34273fb33757353d2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
