# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.348"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.348.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.348/flyctl_0.0.348_Linux_x86_64.tar.gz")
sha256sums=('38da38f0f0565bd27fd59d9bbfc7428785d5f39f4bdca6715510cc3e51f6aeb2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

