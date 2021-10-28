# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.249"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.249.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.249/flyctl_0.0.249_Linux_x86_64.tar.gz")
sha256sums=('3d7961fe9cca2f3490fb3898ac67439592f318d83d3d7cab1bdb60f13987814d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}