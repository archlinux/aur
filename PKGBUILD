# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.323"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.323.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.323/flyctl_0.0.323_Linux_x86_64.tar.gz")
sha256sums=('0fd7b0bafa65ec4c98307f3fe852aec2702f5d2509a89a5988b91f373de12add')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

