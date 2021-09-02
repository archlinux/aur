# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.235"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.235.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.235/flyctl_0.0.235_Linux_x86_64.tar.gz")
sha256sums=('d588a5be9f855580344845826e4ffb840179fde3714bb76c74fef4fc84f6cfdf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}