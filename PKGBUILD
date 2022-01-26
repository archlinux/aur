# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.287"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.287.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.287/flyctl_0.0.287_Linux_x86_64.tar.gz")
sha256sums=('b67a7360ea5d9b5d7cad0acce719fd0475f5f737f88df28c2830fd7902e4c8e9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

