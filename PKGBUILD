# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.328"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.328.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.328/flyctl_0.0.328_Linux_x86_64.tar.gz")
sha256sums=('d93023a1fdcc22ed9e843129af706dce1e1dfe715f54d58a7595fb5b25d1f1f5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

