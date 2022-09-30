# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.401"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.401.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.401/flyctl_0.0.401_Linux_x86_64.tar.gz")
sha256sums=('8152c2d2c4922797d637cfe20b56a425920747010ddcbfbf90896261b777d74a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
