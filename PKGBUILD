# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.330"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.330.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.330/flyctl_0.0.330_Linux_x86_64.tar.gz")
sha256sums=('90999bb2afbb531d29899041b1e2d84d9f83c475a54281bb170c3f4340310c4a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

