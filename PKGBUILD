# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.462"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.462.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.462/flyctl_0.0.462_Linux_x86_64.tar.gz")
sha256sums=('e5f30a00e40885e72fc3013451b5803e455a52be54c34d829ec928b6ae5d9151')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
