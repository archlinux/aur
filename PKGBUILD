# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.295"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.295.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.295/flyctl_0.0.295_Linux_x86_64.tar.gz")
sha256sums=('33c51005e99fc02b41c5b58cb2beb5b40d4e12a46ccd569f9f8639295486da86')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

