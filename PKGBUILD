# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.368"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.368.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.368/flyctl_0.0.368_Linux_x86_64.tar.gz")
sha256sums=('669d45b813064f8c1dfb0ac512f0b8ad331b8a5aef9cad119cbed9aa758fc6aa')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

