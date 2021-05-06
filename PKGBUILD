# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.215"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.215.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.215/flyctl_0.0.215_Linux_x86_64.tar.gz")
sha256sums=('c44572ec2b9343a0d2657adc360b83a928b4d7f7f329799193628f82577a2c26')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}