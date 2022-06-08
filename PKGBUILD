# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.333"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.333.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.333/flyctl_0.0.333_Linux_x86_64.tar.gz")
sha256sums=('5876e1dc65ab2188c75156b2eb98ec000a28b4130e7a0dac2c2f1af562e1dc3b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

