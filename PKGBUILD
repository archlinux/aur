# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.434"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.434.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.434/flyctl_0.0.434_Linux_x86_64.tar.gz")
sha256sums=('c81a72da4def6cf72e76462d626474a78b0d67679a11bc20ed2e302a62463458')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
