# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.273"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.273.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.273/flyctl_0.0.273_Linux_x86_64.tar.gz")
sha256sums=('24845a31ec9b334afcf9745012e1db256d8a5ce0b608c760ade1ab700ea3760e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

