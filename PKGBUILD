# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.414"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.414.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.414/flyctl_0.0.414_Linux_x86_64.tar.gz")
sha256sums=('200037f5fe0a43aa51676c0531232fe3fa7b069af1c08b068cde2a796c9aa74b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
