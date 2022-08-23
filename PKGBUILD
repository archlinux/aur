# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.379"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.379.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.379/flyctl_0.0.379_Linux_x86_64.tar.gz")
sha256sums=('0298c574a7a5880778ef7e169cd2360e3275911847fd637e4ab53f6908609f4b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
