# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.349"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.349.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.349/flyctl_0.0.349_Linux_x86_64.tar.gz")
sha256sums=('1392fff53f43bf30effbb619f21e6cecc73dde11c3f4a521b8ea33cbdf20aa80')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

