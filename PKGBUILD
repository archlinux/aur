# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.405"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.405.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.405/flyctl_0.0.405_Linux_x86_64.tar.gz")
sha256sums=('ffb8de4dff22a4adba276d312417ce035c1a86b27012359f99005238d0347c01')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
