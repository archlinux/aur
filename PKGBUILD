# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.394"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.394.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.394/flyctl_0.0.394_Linux_x86_64.tar.gz")
sha256sums=('7a46a7d01643992251a09291006be207c8c8fd3b682829048ed46be74fd2164e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
