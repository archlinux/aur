# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.227"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.227.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.227/flyctl_0.0.227_Linux_x86_64.tar.gz")
sha256sums=('32a02c6a74177502427ec00bf93408d9e5ef601c48a2fb1b1e9692cee8c14345')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}