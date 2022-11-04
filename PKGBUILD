# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.429"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.429.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.429/flyctl_0.0.429_Linux_x86_64.tar.gz")
sha256sums=('45a60955ccbf88689d7306448c7090175c2a764af50c50c9248e17811ea47629')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
