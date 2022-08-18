# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.376"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.376.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.376/flyctl_0.0.376_Linux_x86_64.tar.gz")
sha256sums=('a3d4f4c9a4ddddedbf4fb05bda8ac75dc497930a471e6c3ff5dd2e36e3fdd99e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
