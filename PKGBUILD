# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.208"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.208.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.208/flyctl_0.0.208_Linux_x86_64.tar.gz")
sha256sums=('703ad173c2c948d6f17d5bc1053a6f781d3e65b0fe6d546891cb21ca8eedd7cf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}