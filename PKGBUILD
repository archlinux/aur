# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.307"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.307.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.307/flyctl_0.0.307_Linux_x86_64.tar.gz")
sha256sums=('3e32e22305b586185d383d8f040999871a9c78dc7b67b2f4e57800d7147cf970')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

