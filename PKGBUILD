# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.399"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.399.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.399/flyctl_0.0.399_Linux_x86_64.tar.gz")
sha256sums=('eb28e74419803ee3c5fb6a4cff97fef03db66dd949116a2fc428fc43d4b8c7e1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
