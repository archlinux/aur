# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.419"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.419.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.419/flyctl_0.0.419_Linux_x86_64.tar.gz")
sha256sums=('5439f70249e1f25f2be0d642a2fa5712cf0ffeed3aa85a5f4f3172724b2d08e3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
