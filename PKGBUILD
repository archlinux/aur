# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.240"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.240.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.240/flyctl_0.0.240_Linux_x86_64.tar.gz")
sha256sums=('34e539e22a340c3e6911c90e6eb0b691dfdbf056897cf22edae92467644e66e4')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}