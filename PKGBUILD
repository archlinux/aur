# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.238"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.238.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.238/flyctl_0.0.238_Linux_x86_64.tar.gz")
sha256sums=('ae8e029c50805b71f0357053aa04d2231ff6f1dd9b5cf957ff1fc84ffea82680')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}