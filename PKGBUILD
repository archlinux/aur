# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.306"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.306.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.306/flyctl_0.0.306_Linux_x86_64.tar.gz")
sha256sums=('15b79b14ebb71ed047c4c72e22b2ef1ffe46385128d917eec5882e385ed64a6e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

