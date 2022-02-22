# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.298"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.298.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.298/flyctl_0.0.298_Linux_x86_64.tar.gz")
sha256sums=('39b9014d290e091882483765de5723bad611d28dcf930e7bae28241a12f4f086')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

