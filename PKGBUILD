# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.442"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.442.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.442/flyctl_0.0.442_Linux_x86_64.tar.gz")
sha256sums=('ed3d01f80e12e0c0b2a9d835061bafbe8d46c21a68215aff3f3c3df26328b13f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
