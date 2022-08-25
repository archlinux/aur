# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.382"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.382.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.382/flyctl_0.0.382_Linux_x86_64.tar.gz")
sha256sums=('504142be92587c5c36ff77ad250c392a5536e385a7e90946f3731dd93e16ad80')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
