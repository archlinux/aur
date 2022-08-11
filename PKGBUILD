# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.370"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.370.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.370/flyctl_0.0.370_Linux_x86_64.tar.gz")
sha256sums=('4e620057bfee3bd7ed7c5d0041b03a691532ded86cbc2ee2e8821c2e2d16b4d9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

