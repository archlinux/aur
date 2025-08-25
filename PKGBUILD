# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=opww
pkgver=1.0.1
pkgrel=1
pkgdesc="Odd Pacman Wrapper Wrapper"
arch=('any')
url="https://github.com/TheOddCell/opww"
license=("MIT")
depends=("python3" "less")
makedepends=()
source=("opww")
sha256sums=('SKIP')

build() {
    chmod a+x opww
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp opww "$pkgdir/usr/bin/opww"
}
