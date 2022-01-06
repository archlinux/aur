# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.279"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.279.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.279/flyctl_0.0.279_Linux_x86_64.tar.gz")
sha256sums=('50553a0e6eb63b17d529293b3441a8f20c5be8e1269f76facd00c8a0f6618a64')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

