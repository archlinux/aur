# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.457"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.457.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.457/flyctl_0.0.457_Linux_x86_64.tar.gz")
sha256sums=('13eaec4b1d234a805eb2625623b2d3a0bfc8c268d2685830d7a1c85c69511a31')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
