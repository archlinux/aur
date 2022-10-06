# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.404"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.404.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.404/flyctl_0.0.404_Linux_x86_64.tar.gz")
sha256sums=('983a052fd91e238dac852f7f6bbd282f0cb2bdfe9d2bc57dc0b469c6b70a1327')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
