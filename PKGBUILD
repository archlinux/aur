# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.233"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.233.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.233/flyctl_0.0.233_Linux_x86_64.tar.gz")
sha256sums=('22db359ae613ba28fb5482627672502080d52c59f971b22b9261072651a9f593')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}