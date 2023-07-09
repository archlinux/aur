# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.1.53"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-$pkgver.tgz::https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('294e09bc7865e7c4e284306df1eec0c2747409d6a63bf9414563a7e7c1d92874')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
