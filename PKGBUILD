# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.430"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.430.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.430/flyctl_0.0.430_Linux_x86_64.tar.gz")
sha256sums=('756d14ffe5516a1f590adf075dec44c487b83dcc527617ce952fa7d538ac605f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
