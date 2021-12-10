# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.268"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.268.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.268/flyctl_0.0.268_Linux_x86_64.tar.gz")
sha256sums=('e7263924657af05920b97f27ba77373a7b8f9a97ba5b25ea2a9eec79a197ffce')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

