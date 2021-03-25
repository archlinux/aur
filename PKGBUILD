# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.195"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.195.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.195/flyctl_0.0.195_Linux_x86_64.tar.gz")
sha256sums=('7341d45e17a68e24c6feeb38dfef2698b867d00f9c74447f6641c4c39f3d0df0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}