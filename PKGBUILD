# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.403"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.403.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.403/flyctl_0.0.403_Linux_x86_64.tar.gz")
sha256sums=('42a3bd30e2569cfca1a2f7ccf0f91f2d91868a94bb178b3f0c5d419d413428c7')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
