# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.388"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.388.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.388/flyctl_0.0.388_Linux_x86_64.tar.gz")
sha256sums=('9c4d9a8d2fb9dfcd68d2c1b2bf0e5944d4955fb9a1c10c90be6a99b7fafd2a70')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
