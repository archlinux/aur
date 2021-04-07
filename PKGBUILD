# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.204"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.204.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.204/flyctl_0.0.204_Linux_x86_64.tar.gz")
sha256sums=('3752ab5d9a5ed3194b9c54ed3f8266c638928032dbb6c6711d1a6e6c6a94fa2c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}