# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.264"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.264.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.264/flyctl_0.0.264_Linux_x86_64.tar.gz")
sha256sums=('f0b69b2641481a29e81b7defe5b2e9a246e4efe5fbfdd294bcb6b9012049f45c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

