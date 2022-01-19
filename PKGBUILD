# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.284"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.284.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.284/flyctl_0.0.284_Linux_x86_64.tar.gz")
sha256sums=('9780a910a49ef48f2185f8cb98e2f64104038e038b4857f6ae37ef155d085f9c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

