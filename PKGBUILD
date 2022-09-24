# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.396"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.396.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.396/flyctl_0.0.396_Linux_x86_64.tar.gz")
sha256sums=('17237492d545106c53f5c2296f47921bbb5a03f4fdc68427721c74b2823d52a4')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
