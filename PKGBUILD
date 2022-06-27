# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.341"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.341.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.341/flyctl_0.0.341_Linux_x86_64.tar.gz")
sha256sums=('83c75ce884e8363f5e89a8e1af20c6abaa52493832688b55680ea75695d06738')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

