# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.200"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.200.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.200/flyctl_0.0.200_Linux_x86_64.tar.gz")
sha256sums=('4c937ffad43adb659c647b8da27102e00b5dca04db1d14b5618d9506cf8e488a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}