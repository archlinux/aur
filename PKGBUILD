# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.241"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.241.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.241/flyctl_0.0.241_Linux_x86_64.tar.gz")
sha256sums=('a4a58a454b6739531fd6f1f5e8a17fbea5f96d4c9a8b42b2dd30e4b3285036ce')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}