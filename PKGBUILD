# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.294"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.294.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.294/flyctl_0.0.294_Linux_x86_64.tar.gz")
sha256sums=('64e22c6ef6e188cff328f179c7f0c33c68a835bf6ea9040c3a67565c81403624')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

