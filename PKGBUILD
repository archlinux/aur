# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.425"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.425.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.425/flyctl_0.0.425_Linux_x86_64.tar.gz")
sha256sums=('a0c4c31134bf000c2d171d7892cc6023c754a559afc195ffddd4dc9b511c9d5f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
