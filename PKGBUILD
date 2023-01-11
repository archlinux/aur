# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.446"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.446.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.446/flyctl_0.0.446_Linux_x86_64.tar.gz")
sha256sums=('20f37397dbc5df4063a5c55689dc0c2cca4069e2972e97f151febbd2c2eeec33')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
