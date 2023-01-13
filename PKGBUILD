# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.450"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.450.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.450/flyctl_0.0.450_Linux_x86_64.tar.gz")
sha256sums=('19314f4304179910d7f7e969616fa6ca1d92721d7e5e0c7493a55d4e27a1116a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
