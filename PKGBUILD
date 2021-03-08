# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.186"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.186.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.186/flyctl_0.0.186_Linux_x86_64.tar.gz")
sha256sums=('bba9904080bf0bc62a51c7ee01a4524c4dcf7e23cf6f81c366f149909a1d4462')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}