# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.300"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.300.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.300/flyctl_0.0.300_Linux_x86_64.tar.gz")
sha256sums=('ae79d7b0c3a57e94b8b8e0ed2f8d4b048b99440b9dd4634bf39384e334bba872')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

