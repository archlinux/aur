# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.389"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.389.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.389/flyctl_0.0.389_Linux_x86_64.tar.gz")
sha256sums=('5d3f8f2d177ad63aa3350b9afe0c5a5619b09f3986575bbb8726cc977e2cf674')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
