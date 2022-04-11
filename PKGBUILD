# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.318"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.318.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.318/flyctl_0.0.318_Linux_x86_64.tar.gz")
sha256sums=('15f45191dbd40aa4e9f93a1748e786da023ab75a328effecba3640d2abdb44cd')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

