# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.337"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.337.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.337/flyctl_0.0.337_Linux_x86_64.tar.gz")
sha256sums=('d89c2e4541edb403dc3fcf20087e6fce69241f139c38c1986bd88ba71a0daddf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

