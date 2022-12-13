# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.438"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.438.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.438/flyctl_0.0.438_Linux_x86_64.tar.gz")
sha256sums=('9d26c676536a15be00d58cc9a513d19ec0e852de3d0ee2979382a072e766e629')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
