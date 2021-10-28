# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.250"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.250.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.250/flyctl_0.0.250_Linux_x86_64.tar.gz")
sha256sums=('c57c8b304bd7e22b0fd8ef9f4c2ddeadc57dcc2e5b48f60e5860869f4b1d7f1a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}