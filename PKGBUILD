# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.206"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.206.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.206/flyctl_0.0.206_Linux_x86_64.tar.gz")
sha256sums=('225d784f91d70d55ee68c06199377a6d96724202b01c242248c90d16b8b6a7cc')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}