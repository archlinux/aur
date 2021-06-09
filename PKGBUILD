# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.224"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.224.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.224/flyctl_0.0.224_Linux_x86_64.tar.gz")
sha256sums=('cc9589a13a7aa939ea666bdc4ecb92f237e69e8a03a95a7d09d31e3117815116')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}