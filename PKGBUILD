# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.213"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.213.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.213/flyctl_0.0.213_Linux_x86_64.tar.gz")
sha256sums=('67e72bd744e6810ad9351b57c4e24c770e39d7e0a0c4d23ff91174672afe5f01')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}