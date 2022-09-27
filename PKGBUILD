# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.397"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.397.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.397/flyctl_0.0.397_Linux_x86_64.tar.gz")
sha256sums=('f0803f100356bcc991d87bdf0885b78bf467cc6b035338a10abe08836ba02a79')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
