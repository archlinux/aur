# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.342"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.342.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.342/flyctl_0.0.342_Linux_x86_64.tar.gz")
sha256sums=('73e4b22a87fb87465b9525336d077392d4e60685e2e83236de36ecf3064d6937')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

