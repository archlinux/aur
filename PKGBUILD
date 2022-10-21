# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.416"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.416.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.416/flyctl_0.0.416_Linux_x86_64.tar.gz")
sha256sums=('1176a4788cf0cd1bd641f0c5a6620c687740cd258d5bdcf154aedfc982892c2b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
