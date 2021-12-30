# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.272"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.272.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.272/flyctl_0.0.272_Linux_x86_64.tar.gz")
sha256sums=('b8bbb9507dd9a8caaf7859c6ae91d6dedf9ccdf7e644e327217a0e4d1cd98b63')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

