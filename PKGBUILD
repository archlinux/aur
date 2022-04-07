# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.315"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.315.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.315/flyctl_0.0.315_Linux_x86_64.tar.gz")
sha256sums=('5dfc904091bb64a38a249ddf5028ea75af4cf12cb25f2d3f25a6ad48010716d1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

