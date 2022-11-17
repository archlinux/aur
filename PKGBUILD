# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.432"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.432.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.432/flyctl_0.0.432_Linux_x86_64.tar.gz")
sha256sums=('92aeac458c7a1f0a7ae42503ce4ff433fceaef39e33513db246faf4a55bea22e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}
