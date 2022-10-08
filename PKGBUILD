# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.406"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.406.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.406/flyctl_0.0.406_Linux_x86_64.tar.gz")
sha256sums=('db74e95a6fe996dfbea2d3de6e464f98b827b4427bd9f682ce31a8b00b8413a5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
