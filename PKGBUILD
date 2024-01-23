# Maintainer: Vitor Gonçalves <vitorg@tilde.team>
pkgname=hii
pkgver=1.1.4
pkgrel=1
pkgdesc="A file-based IRC client inspired by ii"
arch=('x86_64')
url=https://github.com/nmeum/hii
license=('GPL3')
depends=()
makedepends=('make' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nmeum/hii/archive/refs/tags/1.1.4.tar.gz")
sha256sums=('ea11ac36fb7d05f3ce453528d0680c7ea29e173d1b8d927b4949725c67a0a135')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=$pkgdir/usr install
}
