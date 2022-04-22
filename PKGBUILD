# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.322"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.322.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.322/flyctl_0.0.322_Linux_x86_64.tar.gz")
sha256sums=('c5813adf139773d76b770df5fb693b72e602dc1a8f986ebc1a8febbf504067b4')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

