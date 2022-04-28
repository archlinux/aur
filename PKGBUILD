# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.325"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.325.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.325/flyctl_0.0.325_Linux_x86_64.tar.gz")
sha256sums=('c3e736e17cfa90f4dfad9161a75af13f7f9b9c71b7696931fa2246ee5bbb65af')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

