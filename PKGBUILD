# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.202"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.202.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.202/flyctl_0.0.202_Linux_x86_64.tar.gz")
sha256sums=('84605fbbdbab6340dbd919f523f94cddeb8bdce0025b765db9d638ca71730db2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}