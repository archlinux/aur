# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.344"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.344.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.344/flyctl_0.0.344_Linux_x86_64.tar.gz")
sha256sums=('4ca8a8271b666482bb65b9ca7f4f7776894c6c5038fb0471c1d97d767201b548')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

