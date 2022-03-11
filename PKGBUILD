# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.304"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.304.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.304/flyctl_0.0.304_Linux_x86_64.tar.gz")
sha256sums=('bd93c2517ed95dc52a1c958d7467cceb3a0a9c755cc2410560ae0649205902ff')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

