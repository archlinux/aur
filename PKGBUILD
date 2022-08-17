# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.374"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.374.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.374/flyctl_0.0.374_Linux_x86_64.tar.gz")
sha256sums=('256c17a05d1bda3d67080039621ea396fe68793c9ce1d34191796dfbc2e0c4cf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
