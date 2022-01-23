# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.286"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.286.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.286/flyctl_0.0.286_Linux_x86_64.tar.gz")
sha256sums=('c571871e2d59fcd42ac1072cca662c540fd6dd82e040d507c40463740af5fb43')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

