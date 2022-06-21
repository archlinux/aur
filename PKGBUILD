# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.335"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.335.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.335/flyctl_0.0.335_Linux_x86_64.tar.gz")
sha256sums=('78afaa76cd8db759a218ef52df0f918a9dede844cd379ceb8deff690b6482675')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

