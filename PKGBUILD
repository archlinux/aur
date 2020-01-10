# Maintainer: ivanch <jose.henrique.ivan@gmail.com>

pkgname=random
pkgver=1.3
pkgrel=1
pkgdesc="Random number generator."
arch=("any")
url="https://github.com/ivanch/random"
license=('MIT')
depends=('gcc')
source=("${pkgname}::git+https://github.com/ivanch/random")
sha1sums=('SKIP')

package(){
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    gcc random.c -o random
    install -D -m755 ./random $pkgdir/usr/bin/$pkgname
}
