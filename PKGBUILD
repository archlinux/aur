# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.220"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.220.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.220/flyctl_0.0.220_Linux_x86_64.tar.gz")
sha256sums=('d468dbba5e5b72926839a998bcbda0ec93006e18f9be51137e29c57e6eea979e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}