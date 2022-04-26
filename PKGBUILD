# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.324"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.324.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.324/flyctl_0.0.324_Linux_x86_64.tar.gz")
sha256sums=('a2a7a025c7b1479c42785216602fea400a99819e2fa37df855b4e81e389dc64a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

