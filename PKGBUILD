# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.232"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.232.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.232/flyctl_0.0.232_Linux_x86_64.tar.gz")
sha256sums=('322e9a6ba8aadbf53522cbed714820628356781b1979dbdf7cfc9827b5ac0a59')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}