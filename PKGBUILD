# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.301"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.301.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.301/flyctl_0.0.301_Linux_x86_64.tar.gz")
sha256sums=('dc749cc3e0a5b8f4ed9207e8457d94c7bd09d348829bc0714d1a3951eb1db9c1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

