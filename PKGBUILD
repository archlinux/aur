# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=aurbuild
pkgdesc="Collection of scripts to build and release packages from 'aur shaped' repositories"
pkgver=1.0.1
pkgrel=2
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/aurbuild"
license=("MIT")

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    5cb17038b5b2ca78b906cd8da1a247d1432b3211cd7e1bbdfce99c7a1c98b406
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    aurbuild
)

package() {
    install -D -m0755 "$srcdir/aurbuild" "$pkgdir/usr/bin/aurbuild"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
