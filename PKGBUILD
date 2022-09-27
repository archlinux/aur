# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.398"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.398.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.398/flyctl_0.0.398_Linux_x86_64.tar.gz")
sha256sums=('f21f49245d45a703b50cb868dcadd7beea8240c321a49a0c14b762c5ae441add')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
