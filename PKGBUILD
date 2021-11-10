# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.252"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.252.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.252/flyctl_0.0.252_Linux_x86_64.tar.gz")
sha256sums=('e15fe4444d2d1cda6d3b043c7e10dab22f215c7aa04b5752afbc37340e196538')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

