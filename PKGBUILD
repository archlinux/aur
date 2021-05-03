# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.212"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.212.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.212/flyctl_0.0.212_Linux_x86_64.tar.gz")
sha256sums=('f260b259f4af5649658feb8502cae0cf508c43893d7ec06e3add883d7180b09a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}