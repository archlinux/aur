# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.246"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.246.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.246/flyctl_0.0.246_Linux_x86_64.tar.gz")
sha256sums=('f1b91fae851fb529b25ba2d465f1362061d84ebb85350599b1ae85cd7ca183b7')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}