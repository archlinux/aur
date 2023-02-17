# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.459"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.459.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.459/flyctl_0.0.459_Linux_x86_64.tar.gz")
sha256sums=('10f56a0185bed9e01419a07fe577428e52039bec8242469e4f84c74066582062')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
