# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.339"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.339.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.339/flyctl_0.0.339_Linux_x86_64.tar.gz")
sha256sums=('fd3e06648cadf029eda3c058a91b118cac15d2d715d71cdda0e52b0d87419772')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

