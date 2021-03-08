# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.185"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.185.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.185/flyctl_0.0.185_Linux_x86_64.tar.gz")
sha256sums=('1abe7d3280a6459204eb26eafec43669b64ec7170239bb5708b35c1c17526175')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}