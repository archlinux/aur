# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=aurbuild
pkgdesc="Collection of scripts to build and release packages from 'aur shaped' repositories"
pkgver=1.1.0
pkgrel=1
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/aurbuild"
license=("MIT")

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    ef5af3d6a3755a1816cc2648c03d500b8d56895ee0fc5d724c9fc63b36296df3
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    aurbuild
)

package() {
    install -D -m0755 "$srcdir/aurbuild" "$pkgdir/usr/bin/aurbuild"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
