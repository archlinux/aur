# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.210"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.210.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.210/flyctl_0.0.210_Linux_x86_64.tar.gz")
sha256sums=('0656c0400044ab49691e12fc105f51ee121c2827a5210fe65f6ae97956dc9bfd')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}