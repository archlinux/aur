# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.375"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.375.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.375/flyctl_0.0.375_Linux_x86_64.tar.gz")
sha256sums=('41773d1c608d1e8f4cb7abef1c277c5a67612005c78e0bfd3faa097bcdd9e53b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
