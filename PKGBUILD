# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=golang-dep
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="Golang dependency manager"
arch=('x86_64')
url="https://github.com/golang/dep"
license=('BSD')
groups=()
depends=('go>=2:1.9')
makedepends=('go>=2:1.9')
source=("https://github.com/golang/dep/releases/download/v$pkgver/dep-linux-amd64"
        "https://raw.githubusercontent.com/golang/dep/v$pkgver/LICENSE")
sha256sums=("31144e465e52ffbc0035248a10ddea61a09bf28b00784fd3fdd9882c8cbb2315"
            "69c47f09a7aec01c59ff1bdc346406d36e84df11461fb2bed92b0d185a7a2ccb")

package() {
    install -Dm755 $srcdir/dep-linux-amd64 $pkgdir/usr/bin/dep
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/golang-dep
}
