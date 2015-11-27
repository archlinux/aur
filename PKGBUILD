# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=mongoclock
pkgver=2.2
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('GPL3')
depends=(glibc linux)
makedepends=(linux-api-headers general-preprocessor)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(ae2298905a2f729679fddaeb732183b95607438af62dca02bdf5ae0a1b29e950)


build() {
    cd "$srcdir/mongoclock-$pkgver"
    make
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make DESTDIR="${pkgdir}" install
}

