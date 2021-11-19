# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.254"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.254.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.254/flyctl_0.0.254_Linux_x86_64.tar.gz")
sha256sums=('089638ad7c47e6a28ba3bcbcbf93718c246f4105312ced19cb3f4449abc82eaa')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

