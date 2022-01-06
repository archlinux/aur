# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.280"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.280.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.280/flyctl_0.0.280_Linux_x86_64.tar.gz")
sha256sums=('835ebecc2ada4f0b6cbce102fcfa221ad50040d4e29847b1794ba2d777785414')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

