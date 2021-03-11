# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.188"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.188.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.188/flyctl_0.0.188_Linux_x86_64.tar.gz")
sha256sums=('b3443266a88ca2ae9f10efa3aeef64c5742177a09bbb6cb35254c48dbad4cc5d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}