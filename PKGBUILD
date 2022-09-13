# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.390"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.390.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.390/flyctl_0.0.390_Linux_x86_64.tar.gz")
sha256sums=('d8043ac306ca286a32cd54d24e38f095835b727e60b3fe14fa24795c7e9b8eb3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
