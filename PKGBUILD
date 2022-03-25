# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.308"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.308.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.308/flyctl_0.0.308_Linux_x86_64.tar.gz")
sha256sums=('faf96b2dfc2160704d3d1d8438dfea7edc3528fa0b379c264ca851610af1aef2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

