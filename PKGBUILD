# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.356"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.356.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.356/flyctl_0.0.356_Linux_x86_64.tar.gz")
sha256sums=('6c6163d239d94de98a680bf7f17bda0c18425632f9229126ecced634de383858')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

