# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.393"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.393.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.393/flyctl_0.0.393_Linux_x86_64.tar.gz")
sha256sums=('e71a46e7feb0de37e95d2ed927288d0714d67c6eb0426428ec9b4d41abc8a474')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
