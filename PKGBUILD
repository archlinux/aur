# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.223"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.223.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.223/flyctl_0.0.223_Linux_x86_64.tar.gz")
sha256sums=('a0aff7cb31d54a961d9765d7562a4a490df99c2e0d032cfd05df304b5e469b97')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}