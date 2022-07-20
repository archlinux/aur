# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.355"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.355.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.355/flyctl_0.0.355_Linux_x86_64.tar.gz")
sha256sums=('f04f7dfeb1a3ee823f4e40de87c537b932dc32af485e2c95e159ddb3d0a7b64a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

