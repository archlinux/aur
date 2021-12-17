# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.270"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.270.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.270/flyctl_0.0.270_Linux_x86_64.tar.gz")
sha256sums=('002402a4437c79651d281a700bc20a932f8186a8efa9d3428ba9d8b3448533cc')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

