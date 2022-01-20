# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.285"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.285.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.285/flyctl_0.0.285_Linux_x86_64.tar.gz")
sha256sums=('0b298e3f894165c48f866f6a46c8c51b4519ad89f6fce93052ba655abfcb0396')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

