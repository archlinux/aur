# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.395"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.395.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.395/flyctl_0.0.395_Linux_x86_64.tar.gz")
sha256sums=('6d74037df076e75635c7396765ae32a41d6e81bf9c6bf768e644fa834a4617bf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
