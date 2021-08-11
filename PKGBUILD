# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.231"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.231.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.231/flyctl_0.0.231_Linux_x86_64.tar.gz")
sha256sums=('a453755cb07777031c0d9dbc90af27cb0619a3777531ea5d74cec2cb8f5d53d1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 flyctl "$pkgdir/usr/bin"
}