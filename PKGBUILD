# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.190"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.190.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.190/flyctl_0.0.190_Linux_x86_64.tar.gz")
sha256sums=('d26e67a7eeae36f33ce915679a8a4088a2ad46355935d950e3b3aefcdbb22ac5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}