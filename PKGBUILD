# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.194"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.194.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.194/flyctl_0.0.194_Linux_x86_64.tar.gz")
sha256sums=('6267a255ba8dac6d1a8363b0f036e8bfc214069055abfb3ba8f649c85ec9b548')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}