# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.359"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.359.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.359/flyctl_0.0.359_Linux_x86_64.tar.gz")
sha256sums=('70f6dbeba09a3d3c37e25b0430b34679ca390ad6287ddd88f4acf3299cdf29df')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

