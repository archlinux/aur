pkgname=gab
pkgver=0.2
pkgrel=1
pkgdesc="gab, Get another beer, is a AUR helper inspired by the yet-another-yogurt repo."
arch=('x86_64')
license=('GPL')
depends=('curl' 'cjson')
makedepends=('gcc')
source=('gab.c')
md5sums=('SKIP')

build() {
    gcc gab.c -o gab -lcurl -lcjson
}

package() {
    install -Dm755 gab "$pkgdir/usr/bin/gab"
}
