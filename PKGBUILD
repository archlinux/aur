# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.373"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.373.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.373/flyctl_0.0.373_Linux_x86_64.tar.gz")
sha256sums=('361b7862e263b2c18e8d4ee8eaec9a2274587231223d7dda0581d5aaf371fe85')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
