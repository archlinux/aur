# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.182"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.182.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.182/flyctl_0.0.182_Linux_x86_64.tar.gz")
sha256sums=('987d28602fcd10584fc5580ede1edc5c4207c5ac6f9f239d6d1a3c15e097e200')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}