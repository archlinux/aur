# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.347"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.347.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.347/flyctl_0.0.347_Linux_x86_64.tar.gz")
sha256sums=('482c15f26ef5e30e9732a4e761d61862e51c81f67d0720e5f0b15906d3897fa1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

