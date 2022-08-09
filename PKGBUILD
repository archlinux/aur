# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.369"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.369.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.369/flyctl_0.0.369_Linux_x86_64.tar.gz")
sha256sums=('7b48f70409e54cd0def629d54ad19ec78d35e4adb6f525af09cf6f60fa555530')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

