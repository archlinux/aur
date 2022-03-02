# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.302"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.302.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.302/flyctl_0.0.302_Linux_x86_64.tar.gz")
sha256sums=('aa86b64f48b1812e6c8990c0486431994b0c7cec81eba1e78b06f1ddb8cf5d05')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

