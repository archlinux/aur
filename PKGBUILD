# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.1.14"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-$pkgver.tgz::https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4ec3d3978a3dc2e2bf506cb883d07099da51d47b92baafd9abf65940c44e8dd3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
