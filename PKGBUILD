# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.463"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.463.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.463/flyctl_0.0.463_Linux_x86_64.tar.gz")
sha256sums=('d7247539b588cbdf0ca0a62b5244a1aba052887a4d603e19a4ce9a4f6b95b398')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
