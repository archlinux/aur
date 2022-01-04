# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.277"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.277.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.277/flyctl_0.0.277_Linux_x86_64.tar.gz")
sha256sums=('42920693d49bdf8e9f383b8fef05437b94eefa531e6a5c361b74ed7e44784073')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

