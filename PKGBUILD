# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.351"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.351.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.351/flyctl_0.0.351_Linux_x86_64.tar.gz")
sha256sums=('b158ee525f5287dadb8f1c9dd78ec367884d6ef1784bc9901a475ba1d585d58d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

