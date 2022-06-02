# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.331"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.331.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.331/flyctl_0.0.331_Linux_x86_64.tar.gz")
sha256sums=('aa48544154b347cd5f0a4d7da4a082eb40a293da0ab144e56e25f530cc7d7622')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

