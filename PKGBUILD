# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.198"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.198.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.198/flyctl_0.0.198_Linux_x86_64.tar.gz")
sha256sums=('4fa5896e6e38fe72249ffac08181224b382cba2484ca1da229b350de8dda0f50')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}