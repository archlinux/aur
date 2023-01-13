# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.449"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.449.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.449/flyctl_0.0.449_Linux_x86_64.tar.gz")
sha256sums=('49deca012f48d3645dd6c140c52daca9e266acc8a13e946ddee9edafa38d03ae')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
