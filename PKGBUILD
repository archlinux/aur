# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.242"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.242.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.242/flyctl_0.0.242_Linux_x86_64.tar.gz")
sha256sums=('8fb7d5c457d6c25e3cafc48954414786aa4517db4ac469dd3ebf372d94b6dbda')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}