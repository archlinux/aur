# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.275"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.275.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.275/flyctl_0.0.275_Linux_x86_64.tar.gz")
sha256sums=('3bcc7c1704ca07f896a0dc39be9cc912f7dda4365f88b933aae86429a5541697')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

