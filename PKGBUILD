# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.372"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.372.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.372/flyctl_0.0.372_Linux_x86_64.tar.gz")
sha256sums=('0a513be95d5d5a4e4d71901549d21a74d7e44a647c59e679108f92f9b882cfe5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
