# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.420"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.420.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.420/flyctl_0.0.420_Linux_x86_64.tar.gz")
sha256sums=('337814f7afe157baf499c78f319ed7f70a4bb74b58f6199bb20c5a890da34fc2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
