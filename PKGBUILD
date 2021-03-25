# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.196"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.196.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.196/flyctl_0.0.196_Linux_x86_64.tar.gz")
sha256sums=('129ba4495500fa4c4dc690678aa61210d3f007692ed83302b214cd0a19e5764f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}