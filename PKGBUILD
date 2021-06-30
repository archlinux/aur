# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.228"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.228.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.228/flyctl_0.0.228_Linux_x86_64.tar.gz")
sha256sums=('de8943820197554416c24c8cdb3558c715ab942892181d734021111d575aa469')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}