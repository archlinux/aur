# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=aurbuild
pkgdesc="Collection of scripts to build and release packages from 'aur shaped' repositories"
pkgver=2.0.0
pkgrel=1
arch=('any')
url='https://github.com/vbouchaud/aur/tree/main/aurbuild'
license=('MIT')
depends=(
    git
)

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    3303bdfb8fa30e6913f6158f0cd86913dc0c9c83302dad6bd87738a0b5f5b026
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    aurbuild
)

package() {
    install -D -m0755 "$srcdir/aurbuild" "$pkgdir/usr/bin/aurbuild"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
