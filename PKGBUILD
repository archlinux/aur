# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.309"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.309.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.309/flyctl_0.0.309_Linux_x86_64.tar.gz")
sha256sums=('1fa838fdec06f30b27f722cfe279c9c5fe6e427d4db8adef64ce9d79fd37da61')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

