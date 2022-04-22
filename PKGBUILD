# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.321"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.321.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.321/flyctl_0.0.321_Linux_x86_64.tar.gz")
sha256sums=('0797e6feef215b973a23612b237f67f3e2d54296ad134cf40492a4d557a2fb81')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

