# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.226"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.226.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.226/flyctl_0.0.226_Linux_x86_64.tar.gz")
sha256sums=('ed884de0f15abcced61e4e1d6dbe001954549f1b8a722ad55781832d299280d7')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}