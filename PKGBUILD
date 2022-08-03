# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.364"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.364.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.364/flyctl_0.0.364_Linux_x86_64.tar.gz")
sha256sums=('11c19f7d944073b5b1861af66bf8aeb7337fc9e364d01eff1a7261e7ed009868')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

