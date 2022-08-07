# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.367"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.367.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.367/flyctl_0.0.367_Linux_x86_64.tar.gz")
sha256sums=('616e02de68a89cddf32fa9f2b6be0d002e2532d4912582f169e5870dcd1b6cde')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

