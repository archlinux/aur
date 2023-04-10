# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.513"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-$pkgver.tgz::https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('c1df52cad47849259afe1a90c1a9dcfc2a2505d1d31d5bada8b0a656cb351d50')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
