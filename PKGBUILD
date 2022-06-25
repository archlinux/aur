# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.336"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.336.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.336/flyctl_0.0.336_Linux_x86_64.tar.gz")
sha256sums=('10b513218a7e56dfa57b0351a10b419b5d9a6fe27a2a7b06b7f3d194d1105dae')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

