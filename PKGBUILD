# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.452"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.452.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.452/flyctl_0.0.452_Linux_x86_64.tar.gz")
sha256sums=('e1c2b051780337da9d32f277305d358ba849740ef52ad2e44a8b7c8b97e682e1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
