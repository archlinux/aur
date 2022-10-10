# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.408"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.408.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.408/flyctl_0.0.408_Linux_x86_64.tar.gz")
sha256sums=('715fc6abfc40e0971a8504480e7f1e9a0ce7ff5b3bc9466163824f819cf1473b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
