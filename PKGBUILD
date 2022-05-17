# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.327"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.327.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.327/flyctl_0.0.327_Linux_x86_64.tar.gz")
sha256sums=('1cd5507f2b8198def78f6100dc14886a63b4dc43d7fe436ba970a0533f64a974')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

