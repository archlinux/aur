# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.366"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.366.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.366/flyctl_0.0.366_Linux_x86_64.tar.gz")
sha256sums=('657fa5af0911880c4371aff5d180745c22907dd5e9fe110a86d00517e996c797')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

