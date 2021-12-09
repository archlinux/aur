# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.266"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.266.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.266/flyctl_0.0.266_Linux_x86_64.tar.gz")
sha256sums=('25c5810ac6f8b28ad869905a89631d1368b28a1558ba9fbc15589498e29f0616')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

