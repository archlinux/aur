# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.332"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.332.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.332/flyctl_0.0.332_Linux_x86_64.tar.gz")
sha256sums=('24e813311c29503c56759d2c43b5e96ef5a65aa7ab5b4fe18b06eca98b26ee5d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

