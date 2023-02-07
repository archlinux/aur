# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.454"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.454.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.454/flyctl_0.0.454_Linux_x86_64.tar.gz")
sha256sums=('ebfb820df0e8b87b3e0196adf266726cb65e9574320fcdf34cd9970016ad535b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
