# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.291"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.291.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.291/flyctl_0.0.291_Linux_x86_64.tar.gz")
sha256sums=('013a4059e7847ad4af415de3979a5235bd30103d944d78dd25ab157b9dc8a85a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

