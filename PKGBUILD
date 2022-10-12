# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.412"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.412.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.412/flyctl_0.0.412_Linux_x86_64.tar.gz")
sha256sums=('c7d50976954e6fafc1736f0ab9f4cacfbae2a3d5af35745d67898a8e50d85558')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
