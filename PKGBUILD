# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.387"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.387.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.387/flyctl_0.0.387_Linux_x86_64.tar.gz")
sha256sums=('2850bad26aeda1d8c85d83addb663b3abf97008ea44540e06e6c1583dd825442')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
