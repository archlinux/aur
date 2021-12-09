# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.265"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.265.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.265/flyctl_0.0.265_Linux_x86_64.tar.gz")
sha256sums=('826d85fe307cf921d455586640670a5b4040f0b9575fc0ccb5c08cef00f2932f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

