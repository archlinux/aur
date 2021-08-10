# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.230"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.230.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.230/flyctl_0.0.230_Linux_x86_64.tar.gz")
sha256sums=('aa651ba1661f93868254a9781cf0e75bd549f6ec140b456f90e17143c4eba8f0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}