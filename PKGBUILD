# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.371"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.371.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.371/flyctl_0.0.371_Linux_x86_64.tar.gz")
sha256sums=('acc0a0706d39104537c687aac508e9e6a92e0ff1abba02df2cfc519040eaf746')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
