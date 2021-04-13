# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.209"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.209.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.209/flyctl_0.0.209_Linux_x86_64.tar.gz")
sha256sums=('bd07bc2b5a43de57f777237ab68425cc47da3b33cac69845db7ac8a1b097f65b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}