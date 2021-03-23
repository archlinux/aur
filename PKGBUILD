# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.191"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.191.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.191/flyctl_0.0.191_Linux_x86_64.tar.gz")
sha256sums=('bcff5c744e9e582367c3e7c1f265daa010087d7745bf70d6ba841f4159e38695')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}