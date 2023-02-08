# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.455"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.455.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.455/flyctl_0.0.455_Linux_x86_64.tar.gz")
sha256sums=('0abaaf8617b7ceecb11563a5255fabb1b4ccb14b212006db6918686e582c3356')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
