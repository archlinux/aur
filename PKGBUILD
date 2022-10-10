# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.407"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.407.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.407/flyctl_0.0.407_Linux_x86_64.tar.gz")
sha256sums=('89835fbd2d44c903345ae620c74bbd3984601d46bef6b5d75ad88e51b6368b1e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
