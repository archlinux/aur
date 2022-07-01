# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.346"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.346.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.346/flyctl_0.0.346_Linux_x86_64.tar.gz")
sha256sums=('42e28b89e14b95202d2f91f6be6a61ebfc6f68645052971c215129274f1c427b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

