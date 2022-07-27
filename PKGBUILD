# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.361"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.361.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.361/flyctl_0.0.361_Linux_x86_64.tar.gz")
sha256sums=('d86a250373afae9f836f703e00dc7c00355bf50c186b08c5d70b0d370a27fe16')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

