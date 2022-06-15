# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.334"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.334.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.334/flyctl_0.0.334_Linux_x86_64.tar.gz")
sha256sums=('11f36c9c74c97b81bc9fc3fcbd20702fa9ab958dea9fe41f073f265b8c1001da')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

