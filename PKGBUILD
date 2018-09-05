# Maintainer: fakeD <jose-henrique-ivan@hotmail.com>

pkgname=random
pkgver=1.1
pkgrel=1
pkgdesc="Random number generator."
arch=("any")
url="https://gitlab.com/fakeDeathBRX/random"
license=('MIT')
depends=('gcc')
source=("${pkgname}::git+https://gitlab.com/fakeDeathBRX/random")
sha1sums=('SKIP')

package(){
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    gcc random.c -o random
    install -D -m755 ./random $pkgdir/usr/bin/$pkgname
}
