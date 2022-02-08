# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.296"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.296.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.296/flyctl_0.0.296_Linux_x86_64.tar.gz")
sha256sums=('120e954a843a6b6f875cc23bbe4bd36a67f858811b39d718baab2e6e27a7b1bb')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

