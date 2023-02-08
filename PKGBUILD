# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.456"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.456.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.456/flyctl_0.0.456_Linux_x86_64.tar.gz")
sha256sums=('65c5885becddfa91de8eef76eb8b506b76baeaf3bce6e96f313d9bba8d34e649')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
