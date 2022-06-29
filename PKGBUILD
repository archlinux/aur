# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.343"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.343.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.343/flyctl_0.0.343_Linux_x86_64.tar.gz")
sha256sums=('a10d0ebae35a3489b7567036ffa7ea9bc25fe357eebeeb54ad4ea19fcaed7d5c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

