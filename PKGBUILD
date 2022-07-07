# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.350"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.350.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.350/flyctl_0.0.350_Linux_x86_64.tar.gz")
sha256sums=('d7d5ea88616c6bb7ad34f6de5a0f033a0a4ebfdfe6d8d6f2cba164cebb00dca9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

