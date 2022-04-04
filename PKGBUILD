# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.313"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.313.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.313/flyctl_0.0.313_Linux_x86_64.tar.gz")
sha256sums=('b37c9dad8a774f6684571a6250adaa086d538141ab2b61f6e6a7c6a544727f77')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

