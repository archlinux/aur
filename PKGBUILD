# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.402"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.402.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.402/flyctl_0.0.402_Linux_x86_64.tar.gz")
sha256sums=('6b61b77b873c2a5fd7095ac011bce8e36af7e52c84700048a133b6f7f6ac05a6')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
