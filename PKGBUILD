# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.378"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.378.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.378/flyctl_0.0.378_Linux_x86_64.tar.gz")
sha256sums=('72abd7f09e34cbad85d409b21a0464c5da2d52554bff9d819a6d8f4fa7dd2c97')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
