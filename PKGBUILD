# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.236"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.236.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.236/flyctl_0.0.236_Linux_x86_64.tar.gz")
sha256sums=('66290e511b028a50a68f65306982a2eaa47fa874356912d481920283e0b8ebfc')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}