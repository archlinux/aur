# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.192"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.192.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.192/flyctl_0.0.192_Linux_x86_64.tar.gz")
sha256sums=('20099627a3cdc7c4332df15b4bb8c69ba9d60461f47474774249957687b37227')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}