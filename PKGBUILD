# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.365"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.365.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.365/flyctl_0.0.365_Linux_x86_64.tar.gz")
sha256sums=('e1a8bac6e7515eb55fbd8be2d932a632aa79d6f2acc8b3bc8fbd7403073c1e09')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

