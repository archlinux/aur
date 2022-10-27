# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.423"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.423.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.423/flyctl_0.0.423_Linux_x86_64.tar.gz")
sha256sums=('2a8edfd216d17b8dac9d8abc5398187fbdf82f2def351c559812d5e3e2f18c3b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
