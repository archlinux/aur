# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.433"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.433.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.433/flyctl_0.0.433_Linux_x86_64.tar.gz")
sha256sums=('215fb99a3b3be5a95968cab2384194c861d6064e0342c0d6c8460b1785467bb3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
