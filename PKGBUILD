# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.381"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.381.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.381/flyctl_0.0.381_Linux_x86_64.tar.gz")
sha256sums=('083d0088b549f558cdfe37b9a73439d9e8b69c060340871989c9cda750502763')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
