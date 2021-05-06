# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.216"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.216.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.216/flyctl_0.0.216_Linux_x86_64.tar.gz")
sha256sums=('459483cdca742748002afa64abc450e954f62d3ed1615412f7eb2385a8c39811')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}