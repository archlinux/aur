# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.171"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("-0.0.171.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.171/flyctl_0.0.171_Linux_x86_64.tar.gz")
sha256sums=('d64fb7139d0403f5a45361535477db055ae822a616c138717ba63a89cb76ea1c')

package() {
    mkdir -p "/usr/bin"
    install -m755 flyctl "/usr/bin"
}