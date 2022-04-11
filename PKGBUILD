# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.317"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.317.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.317/flyctl_0.0.317_Linux_x86_64.tar.gz")
sha256sums=('677663e1be75f9672ddb05b2628621f454f02ca1a9302a2ba5d2d4842a3103f2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

