# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.311"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.311.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.311/flyctl_0.0.311_Linux_x86_64.tar.gz")
sha256sums=('424613aec9367f12578a792bacd675c9ecf57930643e68daf5e4649d2203e756')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

