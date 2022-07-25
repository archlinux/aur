# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.360"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.360.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.360/flyctl_0.0.360_Linux_x86_64.tar.gz")
sha256sums=('d654d34e366b5612114a9c1e5ff37355d6a743fc01d58aa689be5ca263a0b064')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

