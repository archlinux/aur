# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.314"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.314.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.314/flyctl_0.0.314_Linux_x86_64.tar.gz")
sha256sums=('81287144559601cb4ad5317ebc30c986e34296ace4deacb8ac121d73836b9c05')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

