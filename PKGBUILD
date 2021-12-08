# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.262"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.262.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.262/flyctl_0.0.262_Linux_x86_64.tar.gz")
sha256sums=('738b8ddf96429d88c21b4d590ccc5684aa5fd7bb34bbd9363b86f95d1b5e11c8')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

