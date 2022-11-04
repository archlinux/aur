# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.428"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.428.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.428/flyctl_0.0.428_Linux_x86_64.tar.gz")
sha256sums=('5c769587395880b990288a3840fbb18d9e608c8269553e024f5f10ecd23a23ea')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
