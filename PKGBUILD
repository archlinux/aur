# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.225"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.225.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.225/flyctl_0.0.225_Linux_x86_64.tar.gz")
sha256sums=('c6c35a87e1112089ba264f50a5bbf0a3b3fc24f5dc45dcaef65c4f72d79a5ceb')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}