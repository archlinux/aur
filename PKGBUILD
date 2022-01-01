# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.276"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.276.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.276/flyctl_0.0.276_Linux_x86_64.tar.gz")
sha256sums=('47361786b147e5aee6dfbfaca2ce3ed0c45f1d95066afc26f45b49cb9314f37d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

