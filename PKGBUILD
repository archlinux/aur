# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.229"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.229.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.229/flyctl_0.0.229_Linux_x86_64.tar.gz")
sha256sums=('1eea1a1b47e15a41828f9f68a51479ed50d6a073bc3bdd7a4c1ea3c846dba0fa')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}