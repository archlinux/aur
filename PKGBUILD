# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.267"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.267.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.267/flyctl_0.0.267_Linux_x86_64.tar.gz")
sha256sums=('81b1ed31c785e61c8a564dc8a59b63612eb739825d586c9fa98f723159bc9948')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

