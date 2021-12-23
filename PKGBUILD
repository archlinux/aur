# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.271"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.271.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.271/flyctl_0.0.271_Linux_x86_64.tar.gz")
sha256sums=('d37e995bf1dff9c5f7bc72b17602281bf200ffdcf7ec1de4524d41da62aeb06a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

