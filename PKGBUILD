# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.445"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.445.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.445/flyctl_0.0.445_Linux_x86_64.tar.gz")
sha256sums=('12bde5ee5fae0cdc428d88c2a2f9400a86d36647261203c10a0a82f2d0d5d6b9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
