# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.283"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.283.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.283/flyctl_0.0.283_Linux_x86_64.tar.gz")
sha256sums=('59e8975b9959b91e573d60a9364e6abbec0131bf1f1fe43b1ebb30425ea8fc24')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

