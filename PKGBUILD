# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.211"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.211.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.211/flyctl_0.0.211_Linux_x86_64.tar.gz")
sha256sums=('4505f17ff340ec39df25bd0f24a98b97145b80a6b065d44b7201bb727352d5a2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}