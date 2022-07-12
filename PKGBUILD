# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.353"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.353.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.353/flyctl_0.0.353_Linux_x86_64.tar.gz")
sha256sums=('42d3a3d9cc23f6021126303fd938e0dc6deb948808428c7a29e5e06ff322d8d2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

