# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.441"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.441.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.441/flyctl_0.0.441_Linux_x86_64.tar.gz")
sha256sums=('fc1cfd45a9ec706ebe200c226ecf27f8cc852c43b028a8c6ae4e3e9edca3f66f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
