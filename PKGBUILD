# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.354"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.354.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.354/flyctl_0.0.354_Linux_x86_64.tar.gz")
sha256sums=('709994c639e02f712f3cd4900333cf243f7b917abf16c9f42da3eef04ced6c66')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

