# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.363"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.363.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.363/flyctl_0.0.363_Linux_x86_64.tar.gz")
sha256sums=('11a8a0a2d1b527831e36e6e325508b4297e72f9476191873f4c24d09df224906')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

