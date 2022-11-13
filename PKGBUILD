# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.431"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.431.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.431/flyctl_0.0.431_Linux_x86_64.tar.gz")
sha256sums=('3c91ede21289f6093860cfb21010ab9a15c87bd67a17fc39e960117a40fb2310')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
