# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.245"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.245.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.245/flyctl_0.0.245_Linux_x86_64.tar.gz")
sha256sums=('24eb52f75e3a1371464cf146a24219b445c6f219e300c1f0e6d791fc8fd368ed')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}