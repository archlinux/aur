# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.222"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.222.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.222/flyctl_0.0.222_Linux_x86_64.tar.gz")
sha256sums=('ade7f1f7807487b9d8a06ba4d1475df2aa122ffd47632127b074edddd844f710')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}