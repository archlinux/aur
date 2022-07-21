# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.358"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.358.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.358/flyctl_0.0.358_Linux_x86_64.tar.gz")
sha256sums=('fd3365977d4c933c5a4c270b37faf4fad17d042cd1e2af2c5c11d96f1e3519c0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

