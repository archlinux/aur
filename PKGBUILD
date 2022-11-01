# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.426"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.426.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.426/flyctl_0.0.426_Linux_x86_64.tar.gz")
sha256sums=('0df572d7e8ed07e4a48abf5305dc2b5d2b1c7dd831959e01a2289efbfcc12270')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
