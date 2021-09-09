# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.237"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.237.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.237/flyctl_0.0.237_Linux_x86_64.tar.gz")
sha256sums=('f943e9401a1af36a51bf0adb6666a87e342d1b4a9b41d4357dc05faa3778b7b0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}