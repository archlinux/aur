# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.326"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.326.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.326/flyctl_0.0.326_Linux_x86_64.tar.gz")
sha256sums=('1443a40189a09022476645887d6985741b185828e0586c430cc84ab78bbfc97e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

