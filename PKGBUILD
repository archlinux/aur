# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.377"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.377.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.377/flyctl_0.0.377_Linux_x86_64.tar.gz")
sha256sums=('bfd121994bad1eb99c6cb54b1d781edea0e12d25d24475e1eb9603edc976bdf1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
