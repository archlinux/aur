# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.299"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.299.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.299/flyctl_0.0.299_Linux_x86_64.tar.gz")
sha256sums=('e364e1356930ee9b3a7b27cf770bf54cd099df501ef52b06840c2f45cd59f4d7')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

