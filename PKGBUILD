# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.411"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.411.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.411/flyctl_0.0.411_Linux_x86_64.tar.gz")
sha256sums=('d4158e317889421772bb4ed87a629aa12be617034f18f4215e2b7c5fabcddde3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
