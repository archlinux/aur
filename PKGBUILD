# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.458"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.458.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.458/flyctl_0.0.458_Linux_x86_64.tar.gz")
sha256sums=('4c4f387f451695e5cd880b14943ab056a61548857e5d48a716b6e4b7a99bd217')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
