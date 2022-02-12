# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.297"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.297.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.297/flyctl_0.0.297_Linux_x86_64.tar.gz")
sha256sums=('f50a64d40c7512b4db79b0995c821e81955ba0692a26d6e68be8e1ca963a029d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

