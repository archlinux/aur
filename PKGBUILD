# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.181"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.181.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.181/flyctl_0.0.181_Linux_x86_64.tar.gz")
sha256sums=('e058631e790301b393449dd2e9a69256aab773367650283a5b394d29f0e09a60')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}