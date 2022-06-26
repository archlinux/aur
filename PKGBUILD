# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.338"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.338.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.338/flyctl_0.0.338_Linux_x86_64.tar.gz")
sha256sums=('6c69781384d5713c942e1792b1977e56430fb111e2549a2f79ec1386237de643')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

