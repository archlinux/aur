pkgname=neocat-bin
pkgver=1.0
pkgrel=1
pkgdesc="A simple and fast CLI text viewer"
arch=('x86_64')
url="https://github.com/Enderman1951/neocat"
license=('MIT')
depends=()
provides=('neocat')
conflicts=('neocat')

source=("https://github.com/Enderman1951/neocat/releases/download/v$pkgver/neocat.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 neocat "$pkgdir/usr/bin/neocat"
}
