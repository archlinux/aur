# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.312"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.312.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.312/flyctl_0.0.312_Linux_x86_64.tar.gz")
sha256sums=('9dcd8cc13d52a866d3e5ebeed133a2e6217332beb5e6637f893b8aace1e4846a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

