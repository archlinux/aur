# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.244"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.244.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.244/flyctl_0.0.244_Linux_x86_64.tar.gz")
sha256sums=('518f37ca622384bd2c5a9ca4a2ee280d92e6ce7b4fbe9efbaf6f49fb66e79d60')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}