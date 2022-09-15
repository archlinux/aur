# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.391"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.391.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.391/flyctl_0.0.391_Linux_x86_64.tar.gz")
sha256sums=('b028cc2e28e25eaf2e62c1ccc92e71fb1b63fbe52bd52e87981b6749602065a8')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
