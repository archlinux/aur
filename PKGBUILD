# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.303"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.303.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.303/flyctl_0.0.303_Linux_x86_64.tar.gz")
sha256sums=('87e22621838e185741036f15947d20cffd35b5f0f55ff411f9059674a95df867')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

