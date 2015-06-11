# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dashpipe
pkgver=1.0.3
pkgrel=1
pkgdesc="A utility for ponifying and deponifying text"
arch=('any')
url="http://github.com/DanielOaks/$pkgname/"
license=('MIT')
depends=('perl')
makedepends=('git')
source=("https://github.com/DanielOaks/dashpipe/archive/v${pkgver}.tar.gz")
sha256sums=('c8ed2242113bb5cd867ed934fe0f9745666c289711e70bb54a3c5903e04e3553')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

