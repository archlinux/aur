# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.292"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.292.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.292/flyctl_0.0.292_Linux_x86_64.tar.gz")
sha256sums=('f589dfd5510a342cd1b728af73ed11e0aaa650edb6bcdecbdec0ba693581bbc2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

