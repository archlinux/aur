# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.0.319"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://fly.io"
license=("Apache")
depends=()
provides=("flyctl")
conflicts=("flyctl")
source=("$pkgname-0.0.319.tgz::https://github.com/superfly/flyctl/releases/download/v0.0.319/flyctl_0.0.319_Linux_x86_64.tar.gz")
sha256sums=('91fc27b06fa5673d615f5275d80b21c1c2fb0cfd465652e053629e2689cf4f60')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s flyctl "$pkgdir/usr/bin/fly"
    install -m755 flyctl "$pkgdir/usr/bin"
}

