# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.383"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.383.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.383/flyctl_0.0.383_Linux_x86_64.tar.gz")
sha256sums=('3c284afa7c962609106a78f836b53662fbad1c4892974ea98aeb2fce011572ce')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
