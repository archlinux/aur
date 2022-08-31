# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.384"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.384.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.384/flyctl_0.0.384_Linux_x86_64.tar.gz")
sha256sums=('c3b6375045d7f8d760169b7a1bde913891c70c988fbb9466ee142ca1a8f5f255')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
