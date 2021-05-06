# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.214"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.214.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.214/flyctl_0.0.214_Linux_x86_64.tar.gz")
sha256sums=('d0e6913008006f17755d4f906f2fa9afae268b9ee7767220adf95f0890558a0c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}