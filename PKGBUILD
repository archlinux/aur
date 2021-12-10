# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.269"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.269.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.269/flyctl_0.0.269_Linux_x86_64.tar.gz")
sha256sums=('0f6b43b0aeac5914e1a11df29e451229a2fe3096e69be23d29d15efbb795611d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

