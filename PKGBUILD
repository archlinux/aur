# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.247"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.247.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.247/flyctl_0.0.247_Linux_x86_64.tar.gz")
sha256sums=('d2e92acf8583359dc929ec4893066ee67422789f54bb2bc87f8cdc06fa0d5cff')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}