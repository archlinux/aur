# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.256"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.256.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.256/flyctl_0.0.256_Linux_x86_64.tar.gz")
sha256sums=('7aa8932528014400c5abd70fe209d8bd5c3605d86c44687c19196b92dc4e3c06')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

