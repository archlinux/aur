# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.440"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.440.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.440/flyctl_0.0.440_Linux_x86_64.tar.gz")
sha256sums=('b62da257b2807f9b9c5887f29de026f2e1130ee89f1f3f43de15a7e97c4b8c49')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
