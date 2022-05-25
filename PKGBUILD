# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.329"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.329.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.329/flyctl_0.0.329_Linux_x86_64.tar.gz")
sha256sums=('df0f408f789e17bb3ca35b42080f6c4ef3f22a7c14ca91fd91271c5ea25a2d86')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

