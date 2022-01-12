# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.281"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.281.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.281/flyctl_0.0.281_Linux_x86_64.tar.gz")
sha256sums=('c88958bac124f2fa614198348fa006b2bef77563c7faff179d8ed030ca668901')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

