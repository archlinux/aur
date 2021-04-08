# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.205"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.205.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.205/flyctl_0.0.205_Linux_x86_64.tar.gz")
sha256sums=('5d60b034bba6eb0f7dcb86a33fc74f6a1128b5c47702fbd5f199c4b9f86ebbc3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}