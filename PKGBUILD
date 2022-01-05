# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.278"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.278.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.278/flyctl_0.0.278_Linux_x86_64.tar.gz")
sha256sums=('3fffc934b1e16701f60061f60bd7b8d48b44a345045088ffeb84b1e5ab01c3e9')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

