# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.400"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.400.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.400/flyctl_0.0.400_Linux_x86_64.tar.gz")
sha256sums=('b973601c757190a1d5a05e62b39f4719b92544c477f7027e8b61b934aa31f8cf')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
