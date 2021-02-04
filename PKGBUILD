# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.173"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.173.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.173/flyctl_0.0.173_Linux_x86_64.tar.gz")
sha256sums=('163e82190f48f079c4169b8ab8c2f8bc09aa06ef0cfaf9827297ec3d9c9668f2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}