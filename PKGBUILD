# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.443"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.443.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.443/flyctl_0.0.443_Linux_x86_64.tar.gz")
sha256sums=('fb2774b5707236501ad66556424b23ba177ac5482f37fb7af05d230ba97d44e6')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
