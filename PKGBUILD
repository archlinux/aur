# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.448"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.448.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.448/flyctl_0.0.448_Linux_x86_64.tar.gz")
sha256sums=('945101dfe559c204c15e220ed31e2cf0acc851ab06d618dc25e6bc4eba8cbb7e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
