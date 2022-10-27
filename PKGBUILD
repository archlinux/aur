# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.422"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.422.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.422/flyctl_0.0.422_Linux_x86_64.tar.gz")
sha256sums=('8721dce65b87436180aa688959396af3381c63b3e67bbbab3fa776c55a436e55')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
