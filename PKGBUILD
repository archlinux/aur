# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.253"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.253.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.253/flyctl_0.0.253_Linux_x86_64.tar.gz")
sha256sums=('f2a062869930b0ec79dc1f8b42d46de5c4d97cdf64342e0c59beb84310669ced')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

