# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.234"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.234.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.234/flyctl_0.0.234_Linux_x86_64.tar.gz")
sha256sums=('e00f39577b7265f5bd31abe2c34eb7a6076f5193cd99f2250729c881bca5e8aa')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}