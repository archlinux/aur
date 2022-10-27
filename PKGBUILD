# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.424"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.424.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.424/flyctl_0.0.424_Linux_x86_64.tar.gz")
sha256sums=('43a94dda0c2219477ea1db901ed5849f61bb7e46e19df06570be6abc0003136c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
