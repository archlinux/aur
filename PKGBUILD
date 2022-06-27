# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.340"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.340.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.340/flyctl_0.0.340_Linux_x86_64.tar.gz")
sha256sums=('4131e987ce7a1acd9f83aff4cded040ae0f35478a9b0a4ed7197cf104d2ac6de')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

