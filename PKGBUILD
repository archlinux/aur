# Maintainer: kekmacska

pkgname=rapidhash
pkgver=2d9bfc2 # last change in rapidhash.h
pkgrel=1
pkgdesc='Very fast, high quality, platform-independent hashing algorithm'
arch=('any')
license=('MIT')
url='https://github.com/Nicoshev/rapidhash'
source=(
        "https://raw.githubusercontent.com/Nicoshev/rapidhash/2d9bfc2/rapidhash.h"
        "https://raw.githubusercontent.com/Nicoshev/rapidhash/refs/heads/master/LICENSE"
        )
depends=()
provides=($pkgname)
b2sums=(
        17606ff52eefd6c6c7275be1adba0158b62713a47f410ac40f204d7d24a4b5db69a73826383e4a3c73a04d4bc0e812684271571d10aa559377a0a3be223d5342
        d03c2d868880e1da0df7cbc0567e83707ca2d14af22006e5ef4548f135933d52dc69f12e8e32a3063c86db4513d9bad683e10f9cce8dbfbf59b3ab3820ca9e57
        ) # rapidhash.h
          # LICENSE

package() {
    cd "$srcdir"

    install -Dm644 rapidhash.h "$pkgdir/usr/include/rapidhash.h"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
